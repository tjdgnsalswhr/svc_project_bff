package com.skcc.svc.common.vo;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommCodeVo {
	private String langCd;
	private String groupId;
	private String codeId;
	private String codeName;
	
	 @Builder
	public CommCodeVo(String langCd, String groupId, String codeId, String codeName) {
		this.groupId = groupId;
		this.codeId = codeId;
		this.codeName = codeName;
		this.langCd = langCd;
	}
	
	
}
