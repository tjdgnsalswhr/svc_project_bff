package com.skcc.svc.application.login.vo;

import java.time.LocalDateTime;

import java.util.Date;

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
public class BalanceInfoResponseDTO {
	String bid;
	String cid;			//Order Id
	String sid; 	//1. 충전, 2. 결제
	int totalmoney;	//주문에 연관된 가게 이름
	int remainmoney;	//주문에 연관된 팀 이름
}
