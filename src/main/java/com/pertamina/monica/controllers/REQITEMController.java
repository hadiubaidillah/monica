package com.pertamina.monica.controllers;

import java.io.File;
import java.net.URL;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.pertamina.monica.domain.REQITEM;
import com.pertamina.monica.helper.Pagination;
import com.pertamina.monica.helper.QueryParameter;
import com.pertamina.monica.helper.ResponseWrapper;
import com.pertamina.monica.helper.ResponseWrapperPagination;
import com.pertamina.monica.mapper.REQITEMMapper;
import com.pertamina.monica.repo.StorageService;

@RestController
@RequestMapping("/REQITEM")
public class REQITEMController {

	@Autowired
	private REQITEMMapper reqItemMapper;
	
	@Autowired
	protected StorageService storageService;
	
	@RequestMapping(value="/list", method = RequestMethod.GET, produces = "application/json")
	@Transactional(rollbackFor=Exception.class, propagation = Propagation.REQUIRED)
	public ResponseWrapperPagination getList(
			HttpServletRequest request,
			@RequestParam("mode") String mode,
			@RequestParam("term") String term,
			@RequestParam("image") Optional<String> image,
			@RequestParam("time") Optional<String> time,
			@RequestParam("min") Optional<String> min, // khusus custom rage
			@RequestParam("max") Optional<String> max, // khusus custom rage
			@RequestParam("limit") Optional<Integer> limit,
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("is-pagination-next") Optional<String> isPaginationNext
			)throws Exception {
		QueryParameter param = new QueryParameter();
		param.setClause(param.getClause() + " AND ( ");
		param.setClause(param.getClause() + REQITEM.COLUMN_REQUESTEDBY + " LIKE '%"+term+"%' OR ");
		param.setClause(param.getClause() + REQITEM.COLUMN_REQUESTTYPE + " LIKE '%"+term+"%' OR ");
		param.setClause(param.getClause() + REQITEM.COLUMN_CODING + " LIKE '%"+term+"%' OR ");
		param.setClause(param.getClause() + REQITEM.COLUMN_COMPANY + " LIKE '%"+term+"%' ");
		param.setClause(param.getClause() + " ) ");
		
		if(time.isPresent() && time.get().equals("any-time") == false) {
			param.setClause(param.getClause() + " AND date_added NOW() - 1");
			if(time.get().equals("custom-range") && min.isPresent() && max.isPresent()) {
				param.setClause(param.getClause() + " AND date_added BETWEEN "+min+" AND " + max +"");
			}
		}
		
		final long count = reqItemMapper.getCount(param);
		
		if(limit.isPresent()) { param.setLimit(limit.get()); }
		else { limit = Optional.of(10); param.setLimit(limit.get()); } // pengaturan limit
		if(page.isPresent()) { int offset = (page.get()-1)*param.getLimit(); param.setOffset(offset); }
		else { page = Optional.of(1); }
		
		ResponseWrapperPagination resp = new ResponseWrapperPagination();
		resp.setPagination(new Pagination(param.getLimit(), page.get(), count));
		final List<REQITEM> data = reqItemMapper.getList(param);
		resp.setData(data);
		
		resp.setCount(count);
		resp.setNextMore(data.size()+((page.get()-1)*param.getLimit()) < resp.getCount());
		
		String qryString = "?page="+(page.get()+1);
		if(limit.isPresent()) { qryString += "&limit="+limit.get(); }
		resp.setNextPageNumber(page.get()+1);
		resp.setNextPage(request.getRequestURL().toString()+qryString);
		
		return resp;
	}
	
	@RequestMapping(value="/list-by-image-url", method = RequestMethod.GET, produces = "application/json")
	@Transactional(rollbackFor=Exception.class, propagation = Propagation.REQUIRED)
	public ResponseWrapperPagination getListByImageUrl(@RequestParam("url") String url)throws Exception {
		ResponseWrapperPagination resp = new ResponseWrapperPagination();
		resp.setMessage("/list-by-image-url \nini pesan dari server \n"+url+"");
		resp.setImage(url);
		
		File file = File.createTempFile("tmp-"+new Date().getTime(), "."+FilenameUtils.getExtension(url), new File(System.getProperty("java.io.tmpdir")));
		try {
			FileUtils.writeByteArrayToFile(file, IOUtils.toByteArray(new URL(url).openStream()));
		} catch (Exception e) {
			
		}
		
		// TODO: file silahkan di cari yang mirip
		
		return resp;
	}
	
	@RequestMapping(value="/list-by-image-upload", method = RequestMethod.POST, produces = "application/json")
	@Transactional(rollbackFor=Exception.class, propagation = Propagation.REQUIRED)
	public ResponseWrapperPagination getListByImageUpload(HttpServletRequest request, @RequestParam("upload") MultipartFile upload)throws Exception {
		ResponseWrapperPagination resp = new ResponseWrapperPagination();
		resp.setMessage("/list-by-image-upload \nini pesan dari server \n"+upload.getOriginalFilename()+"");

		File file = File.createTempFile("tmp-"+new Date().getTime(), "."+FilenameUtils.getExtension(upload.getOriginalFilename()), new File(System.getProperty("java.io.tmpdir")));
		try {
			FileUtils.writeByteArrayToFile(file, IOUtils.toByteArray(upload.getInputStream()));
		} catch (Exception e) {
			
		}
		
		// TODO: file silahkan di cari yang mirip
		
		resp.setImage("http"+(request.isSecure()?"s":"")+"://"+request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/files/" + file.getName() + "?filename=" + file.getName());
		return resp;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<ResponseWrapper> getById(@PathVariable String id) throws Exception {
		ResponseWrapper resp = new ResponseWrapper();
		REQITEM data = reqItemMapper.getEntity(id);
		resp.setData(data);
		return new ResponseEntity<ResponseWrapper>(resp, HttpStatus.valueOf(resp.getCode()));
	}

	@RequestMapping(value="/save", method = RequestMethod.POST, produces = "application/json")
	@Transactional(rollbackFor=Exception.class, propagation = Propagation.REQUIRED)
	public ResponseEntity<ResponseWrapper> save(
			HttpServletRequest request,
			@RequestParam("LINENUM") Optional<Long> LINENUM,
			@RequestParam("COMPANY") Optional<String> COMPANY,
			@RequestParam("REQUESTEDBY") Optional<String> REQUESTEDBY,
			@RequestParam("REQUESTTYPE") Optional<String> REQUESTTYPE,
			@RequestParam("OLDITEMNUM") Optional<String> OLDITEMNUM,
			@RequestParam("MAINGROUP") Optional<String> MAINGROUP,
			@RequestParam("NOUNMODIFIER") Optional<String> NOUNMODIFIER,
			@RequestParam("CODING") Optional<String> CODING,
			@RequestParam("SHORTTEXT") Optional<String> SHORTTEXT,
			@RequestParam("ISSPAREPART") Optional<String> ISSPAREPART,
			@RequestParam("POTEXT") Optional<String> POTEXT,
			@RequestParam("PURCHASINGGROUP") Optional<String> PURCHASINGGROUP,
			@RequestParam("MANUFACTURER") Optional<String> MANUFACTURER,
			@RequestParam("PARTNUMBER") Optional<String> PARTNUMBER,
			@RequestParam("UOM") Optional<String> UOM,
			@RequestParam("MATTYPE") Optional<String> MATTYPE,
			@RequestParam("PROFITCENTER") Optional<String> PROFITCENTER,
			@RequestParam("LABOFFICE") Optional<String> LABOFFICE,
			@RequestParam("STATUS") Optional<String> STATUS,
			@RequestParam("GAMBAR") Optional<MultipartFile> GAMBAR
			) throws Exception {
		
		ResponseWrapper resp = new ResponseWrapper();
		
		REQITEM data = new REQITEM(Long.parseLong(reqItemMapper.getNewId()));
		if(LINENUM.isPresent()) {
			data.setLINENUM(LINENUM.get());
			data = reqItemMapper.getEntity(String.valueOf(LINENUM.get()));
		}
		if(data == null) {
			resp.setCode(HttpStatus.BAD_REQUEST.value());
			resp.setMessage("Data tidak ditemukan.");
			return new ResponseEntity<ResponseWrapper>(resp, HttpStatus.valueOf(resp.getCode()));
		}
		if(COMPANY.isPresent()) data.setCOMPANY(COMPANY.get());
		if(REQUESTEDBY.isPresent()) data.setREQUESTEDBY(REQUESTEDBY.get());
		if(REQUESTTYPE.isPresent()) data.setREQUESTTYPE(REQUESTTYPE.get());
		if(OLDITEMNUM.isPresent()) data.setOLDITEMNUM(OLDITEMNUM.get());
		if(MAINGROUP.isPresent()) data.setMAINGROUP(MAINGROUP.get());
		if(NOUNMODIFIER.isPresent()) data.setNOUNMODIFIER(NOUNMODIFIER.get());
		if(CODING.isPresent()) data.setCODING(CODING.get());
		if(SHORTTEXT.isPresent()) data.setSHORTTEXT(SHORTTEXT.get());
		if(ISSPAREPART.isPresent()) data.setISSPAREPART(ISSPAREPART.get());
		if(POTEXT.isPresent()) data.setPOTEXT(POTEXT.get());
		if(PURCHASINGGROUP.isPresent()) data.setPURCHASINGGROUP(PURCHASINGGROUP.get());
		if(MANUFACTURER.isPresent()) data.setMANUFACTURER(MANUFACTURER.get());
		if(PARTNUMBER.isPresent()) data.setPARTNUMBER(PARTNUMBER.get());
		if(UOM.isPresent()) data.setUOM(UOM.get());
		if(MATTYPE.isPresent()) data.setMATTYPE(MATTYPE.get());
		if(PROFITCENTER.isPresent()) data.setPROFITCENTER(PROFITCENTER.get());
		if(LABOFFICE.isPresent()) data.setLABOFFICE(LABOFFICE.get());
		if(STATUS.isPresent()) data.setSTATUS(STATUS.get());
		//if(GAMBAR.isPresent()) data.setGAMBAR(GAMBAR.get());
		
		boolean pass = true;
		if(data.getCOMPANY() == null) {
			pass = false;
		}else if(data.getCOMPANY().equals("")) {
			pass = false;
		}
		
		if(!pass) {
			resp.setCode(HttpStatus.BAD_REQUEST.value());
			resp.setMessage("Input belum lengkap, harap dilengkapi terlebih dahulu.");
			return new ResponseEntity<ResponseWrapper>(resp, HttpStatus.valueOf(resp.getCode()));
		}
		
		if(LINENUM.isPresent()) {
			reqItemMapper.update(data);
		}else {
			reqItemMapper.insert(data);
		}
		
		resp.setData(data);
		
		return new ResponseEntity<ResponseWrapper>(resp, HttpStatus.valueOf(resp.getCode()));
	}

	@RequestMapping(value="/{id}/delete", method = RequestMethod.POST, produces = "application/json")
	@Transactional(rollbackFor=Exception.class, propagation = Propagation.REQUIRED)
	public ResponseEntity<ResponseWrapper> delete(HttpServletRequest request, @PathVariable String id) throws Exception {
		ResponseWrapper resp = new ResponseWrapper();
		REQITEM data = reqItemMapper.getEntity(id);
		resp.setData(data);
		reqItemMapper.delete(data);
		return new ResponseEntity<ResponseWrapper>(resp, HttpStatus.valueOf(resp.getCode()));
	}

	private Pagination pagination = new Pagination();
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

}

class MultipartFileWrapper {
	
	MultipartFile multipartFile;

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}
	
}
