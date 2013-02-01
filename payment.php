<?php

include(dirname(__FILE__).'/../../config/config.inc.php');
include(dirname(__FILE__).'/../../header.php');
include(dirname(__FILE__).'/ccpayment.php');

if (!$cookie->isLogged())
    Tools::redirect('authentication.php?back=order.php');
	
$ccpayment = new ccpayment();
echo $ccpayment->execPayment($cart);

include_once(dirname(__FILE__).'/../../footer.php');

?>