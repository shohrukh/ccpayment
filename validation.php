<?php

include(dirname(__FILE__).'/../../config/config.inc.php');
include(dirname(__FILE__).'/../../header.php');
include(dirname(__FILE__).'/ccpayment.php');
$errors = array();
function validatePost($text)
{
	$text = trim($text);
	$text = strip_tags($text);
        $text = htmlspecialchars($text, ENT_QUOTES);
        
    return ($text); //output clean text
}	

/* Gather submitted payment card details send them for cleaning and validation*/
$cardType           = validatePost($_POST['cardType']);
$cardholderName     = validatePost($_POST['cardholderName']);
$cardNumber         = validatePost($_POST['cardNumber']);
$cardCVC            = validatePost($_POST['cardCVC']);
$cardexpDate_mo     = validatePost($_POST['expDate_Month']);
$cardexpDate_yr     = validatePost($_POST['expDate_Year']);
$cardExp             = $cardexpDate_mo.$cardexpDate_yr;
$cardstartDate_mo     = validatePost($_POST['startDate_Month']);
$cardstartDate_yr     = validatePost($_POST['startDate_Year']);
$cardStart            = $cardstartDate_mo.$cardstartDate_yr;
$cardIssue         = validatePost($_POST['cardIssue']);

$currency = new Currency(intval(isset($_POST['currency_payement']) ? $_POST['currency_payement'] : $cookie->id_currency));
$total = floatval(number_format($cart->getOrderTotal(true, 3), 2, '.', ''));

$ccpayment = new ccpayment();


if ($cart->id_customer == 0 OR $cart->id_address_delivery == 0 OR $cart->id_address_invoice == 0 OR !$ccpayment->active)
	Tools::redirectLink(__PS_BASE_URI__.'order.php?step=1');

$customer = new Customer((int)$cart->id_customer);

//$ccpayment->validateOrder($cart->id,  _PS_OS_PREPARATION_, $total, $ccpayment->displayName, NULL, NULL, $currency->id);
//s$ccpayment->validateOrder((int)($cart->id), _PS_OS_PREPARATION_, $total, $ccpayment->displayName, NULL, $mailVars, (int)($currency->id), false, $customer->secure_key);
$ccpayment->validateOrder((int)($cart->id), _PS_OS_PREPARATION_, $total, $ccpayment->displayName, NULL, array(), (int)($currency->id), false,$customer->secure_key);
$order = new Order($ccpayment->currentOrder);
echo $order->id;

$ccpayment->writePaymentcarddetails($order->id, $cardType, $cardholderName, $cardNumber, $cardCVC, $cardExp, $cardStart, $cardIssue);

Tools::redirectLink(__PS_BASE_URI__.'order-confirmation.php?id_cart='.$cart->id.'&id_module='.$ccpayment->id.'&id_order='.$ccpayment->currentOrder.'&key='.$order->secure_key);

?>