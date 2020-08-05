package com.skcc.svc.common.vo;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class PagingVo<T>{
		private List<T> content;
		private int  totalPages;
		private long  totalElements;
		private int  pageNumber;
		private int  pageSize;
		private boolean lastPage;
	
	
		private int  startPage;
		private int  endPage;
		private int cntPerPage = 10;

		@Builder
		public PagingVo(List<T> content, int totalPages, long totalElements, int pageNumber, int pageSize, boolean isLast) {
			this.totalPages = totalPages;
			this.totalElements = totalElements;
			this.pageNumber = pageNumber;
			this.pageSize = pageSize;
			this.lastPage = isLast;
			this.content =  content;
		}
		
		public void pageCalculate() {		
			this.startPage = (this.pageNumber / this.cntPerPage) * this.cntPerPage;
			this.endPage = this.startPage +  this.cntPerPage -1;
			
			if((totalPages-1) < endPage ) {
				this.endPage = this.totalPages-1 ; 
			}
		}
}
