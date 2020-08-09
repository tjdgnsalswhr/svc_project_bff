package com.skcc.svc.application.login.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ToString
@NoArgsConstructor
@Getter
@Setter
public class StoreResponseDTO {
	String sid;
	String storename;
	String ownername;
	String ownerid;
	String address;
	String openinfo;
	String phonenumber;
	String storecode;
	int earnings;
}
