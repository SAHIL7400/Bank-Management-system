<?php 
function setBalance($amount,$process,$accountNo)
{
	$con = new mysqli('localhost','root','','Sevabank');
	$array = $con->query("select * from userAccounts where accountNo='$accountNo'");
	$row = $array->fetch_assoc();
	if ($process == 'credit') 
	{
		$balance = $row['balance'] + $amount;
		return $con->query("update userAccounts set balance = '$balance' where accountNo = '$accountNo'");
	}else
	{
		$balance = $row['balance'] - $amount;
		return $con->query("update userAccounts set balance = '$balance' where accountNo = '$accountNo'");
	}
}
// function setOtherBalance($amount,$process,$accountNo)
// {
// 	$con = new mysqli('localhost','root','','Sevabank');
// 	$array = $con->query("select * from otheraccounts where accountNo='$accountNo'");
// 	$row = $array->fetch_assoc();
// 	if ($process == 'credit') 
// 	{
// 		$balance = $row['balance'] + $amount;
// 		return $con->query("update otheraccounts set balance = '$balance' where accountNo = '$accountNo'");
// 	}else
// 	{
// 		$balance = $row['balance'] - $amount;
// 		return $con->query("update otheraccounts set balance = '$balance' where accountNo = '$accountNo'");
// 	}
// }
function makeTransaction($action,$amount,$beneficiaryAcc)
{
	$con = new mysqli('localhost','root','','Sevabank');
	if ($action == 'transfer')
	{
		return $con->query("insert into transaction (action,debit,beneficiaryAcc,userId) values ('transfer','$amount','$beneficiaryAcc','$_SESSION[userId]')");
	}
	if ($action == 'withdraw')
	{
		return $con->query("insert into transaction (action,debit,beneficiaryAcc,userId) values ('withdraw','$amount','$beneficiaryAcc','$_SESSION[userId]')");
		
	}
	if ($action == 'deposit')
	{
		return $con->query("insert into transaction (action,credit,beneficiaryAcc,userId) values ('deposit','$amount','$beneficiaryAcc','$_SESSION[userId]')");
		
	}
}
function makeTransactionCashier($action,$amount,$beneficiaryAcc,$userId)
{
	$con = new mysqli('localhost','root','','Sevabank');
	if ($action == 'transfer')
	{
		return $con->query("insert into transaction (action,debit,beneficiaryAcc,userId) values ('transfer','$amount','$beneficiaryAcc','$userId')");
	}
	if ($action == 'withdraw')
	{
		return $con->query("insert into transaction (action,debit,beneficiaryAcc,userId) values ('withdraw','$amount','$beneficiaryAcc','$userId')");
		
	}
	if ($action == 'deposit')
	{
		return $con->query("insert into transaction (action,credit,beneficiaryAcc,userId) values ('deposit','$amount','$beneficiaryAcc','$userId')");
		
	}
}
 ?>