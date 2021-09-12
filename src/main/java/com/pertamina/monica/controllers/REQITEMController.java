package com.pertamina.monica.controllers;


import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
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
			@RequestParam("min") Optional<String> min,
			@RequestParam("max") Optional<String> max,
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
		
		final long count = reqItemMapper.getCount(param);
		
		if(limit.isPresent()) { param.setLimit(limit.get()); }
		else { limit = Optional.of(10); }
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
		return resp;
	}
	
	@RequestMapping(value="/list-by-image-upload", method = RequestMethod.POST, produces = "application/json")
	@Transactional(rollbackFor=Exception.class, propagation = Propagation.REQUIRED)
	public ResponseWrapperPagination getListByImageUpload(HttpServletRequest request, @RequestParam("upload") MultipartFile upload)throws Exception {
		ResponseWrapperPagination resp = new ResponseWrapperPagination();
		System.out.println("file: " + upload.getOriginalFilename());
		resp.setMessage("/list-by-image-upload \nini pesan dari server \n"+upload.getOriginalFilename()+"");
		final long date = new Date().getTime();
		final String ext = FilenameUtils.getExtension(upload.getOriginalFilename());
		final String filename = "tmp-"+date+"."+ext;
		storageService.store(upload, filename);
		resp.setImage("http"+(request.isSecure()?"s":"")+"://"+request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/files/" + filename + "?filename=" + filename);
		return resp;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<ResponseWrapper> getById(@PathVariable String id) throws Exception {
		ResponseWrapper resp = new ResponseWrapper();
		REQITEM data = reqItemMapper.getEntity(id);
		resp.setData(data);
		return new ResponseEntity<ResponseWrapper>(resp, HttpStatus.valueOf(resp.getCode()));
	}
	
	/*@RequestMapping(value="/list2", method = RequestMethod.GET, produces = "application/json")
	@Transactional(rollbackFor=Exception.class, propagation = Propagation.REQUIRED)
	public ResponseWrapperList getList2(
			HttpServletRequest request,
			@RequestParam("mode") String mode,
			@RequestParam("term") String term,
			@RequestParam("time") Optional<String> time,
			@RequestParam("min") Optional<String> min,
			@RequestParam("max") Optional<String> max,
			@RequestParam("limit") Optional<Integer> limit,
			@RequestParam("page") Optional<Integer> page
			)throws Exception {
		QueryParameter param = new QueryParameter();
		param.setClause(param.getClause() + " AND ( ");
		param.setClause(param.getClause() + REQITEM.COLUMN_REQUESTEDBY + " LIKE '%"+term+"%' OR ");
		param.setClause(param.getClause() + REQITEM.COLUMN_REQUESTTYPE + " LIKE '%"+term+"%' OR ");
		param.setClause(param.getClause() + REQITEM.COLUMN_CODING + " LIKE '%"+term+"%' OR ");
		param.setClause(param.getClause() + REQITEM.COLUMN_COMPANY + " LIKE '%"+term+"%' ");
		param.setClause(param.getClause() + " ) ");

		if(limit.isPresent()) { param.setLimit(limit.get()); if(limit.get() > 2000000000) param.setLimit(2000000000); }
		else { param.setLimit(10); }
		
		int pPage = 1;
		if(page.isPresent()) { pPage = page.get(); int offset = (pPage-1)*param.getLimit(); param.setOffset(offset); }
		
		ResponseWrapperList resp = new ResponseWrapperList();
		List<REQITEM> data = reqItemMapper.getList(param);
		resp.setData(data);
		resp.setCount(reqItemMapper.getCount(param));
		resp.setNextMore(data.size()+((pPage-1)*param.getLimit()) < resp.getCount());
		
		String qryString = "?page="+(pPage+1);
		if(limit.isPresent()) { qryString += "&limit="+limit.get(); }
		resp.setNextPageNumber(pPage+1);
		resp.setNextPage(request.getRequestURL().toString()+qryString);
		
		return resp;
	}*/

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
			@RequestParam("GAMBAR") Optional<String> GAMBAR
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
		if(GAMBAR.isPresent()) data.setGAMBAR(GAMBAR.get());
		
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
	
	/*@RequestMapping(value = "/new-id", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<ResponseWrapper> getNewId() throws Exception {
		ResponseWrapper resp = new ResponseWrapper();
		String newId = String.valueOf(reqItemMapper.getNewId());
		resp.setData(newId);
		return new ResponseEntity<ResponseWrapper>(resp, HttpStatus.valueOf(resp.getCode()));
	}*/

	private Pagination pagination = new Pagination();
	
	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

}
