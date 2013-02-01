{capture name=path}{l s='Payment'}{/capture}

{include file="$tpl_dir./breadcrumb.tpl"}

<script language="javascript" src="{$this_path}js/ccpayment.js"></script>
<link href="{$this_path}css/ccpayment.css" rel="stylesheet" type="text/css" media="all" />


<form action="{$this_path_ssl}validation.php" class="ccpaymentForm" id="ccpaymentForm" name="ccpaymentForm" method="post">
				

					<fieldset>
					  <legend>{l s='Payment Card Details' mod='ccpayment'}</legend>
					  	<p>Please complete the form below. Mandatory fields marked <em>*</em></p>
					  <ol>
						<li>
						  <label for="cardType">{l s='Card Type:' mod='ccpayment'}<em>*</em></label>
						  <select name="cardType" id="cardType">{$this_valid_card}</select>  <span style="font-size:0.8em;" class="hotspot" onmouseover="tooltip.show('{l s="Use this drop down to select the type of payment card" mod='ccpayment'}');" onmouseout="tooltip.hide();">{l s="What is this?" mod='ccpayment'}</span>
						</li>
						<li>
						  <label for="cardholderName">{l s='Name on Card:' mod='ccpayment'}<em>*</em></label>
						  <input type="text"  name="cardholderName" id="cardholderName" />  <span style="font-size:0.8em;" class="hotspot" onmouseover="tooltip.show('{l s="The name of the card holder as written on the front of the card" mod='ccpayment'}');" onmouseout="tooltip.hide();">{l s="What is this?" mod='ccpayment'}</span>
						  <div id="errcardholderName" style="color:red;display: none;">{l s="Card Holder Name is Required" mod='ccpayment'}</div>
						</li>
						<li>
						  <label for="cardNumber">{l s='Card Number:' mod='ccpayment'}<em>*</em></label>
						  <input type="text"  name="cardNumber" id="cardNumber" />  <span style="font-size:0.8em;" class="hotspot" onmouseover="tooltip.show('{l s="The card number is the long number embossed on the front of your card'" mod='ccpayment'});" onmouseout="tooltip.hide();">{l s="What is this?" mod='ccpayment'}</span>
						  <div id="errcardNumber" style="color:red;display: none;"></div>
						</li>
						<li>
						  <label for="cardCVC">{l s='CVV/CVC Security Number:' mod='ccpayment'} <em>*</em></label>
						  <input type="text" size="3" name="cardCVC" id="cardCVC"  />  <span style="font-size:0.8em;" class="hotspot" onmouseover="tooltip.show('{l s="CVC/CVV numbers are found on the back of your card. <br><img src=\'cvc.png\' >" mod='ccpayment'}');" onmouseout="tooltip.hide();">{l s="What is this?" mod='ccpayment'}</span>
						   <div id="errcardCVC" style="color:red;display: none;">{l s="Valid CVC is Required" mod='ccpayment'}</div>
						</li>
						<li>
						  <label for="ExpDate_yr">{l s='Expiration Date:' mod='ccpayment'}<em>*</em></label>
						  <div id="errExpDate" style="color:red;display: none;">{l s="Valid Expiration Date is Required" mod='ccpayment'}</div>
						  {html_select_date 
								prefix='expDate_' 
								start_year='-0'
								end_year='+15' 
								display_days=false
								year_empty="Year" 
								month_empty="Month"}
						</li>
					</fieldset>
					<fieldset>	
					 <p>You only need to enter a start date if the card has one</p>
						<li>
						  <label for="startDate_yr">{l s='Start Date:' mod='ccpayment'}</label>
							{html_select_date 
							prefix='startDate_' 
							start_year='-0'
							end_year='+15' 
							display_days=false
							year_empty="Year" 
							month_empty="Month"}
						</li>
					  <p>You only need to enter an issue number if card has one</p>
                           <li> 
						   <label>{l s='Issue Number:' mod='ccpayment'}</label>
						   <input type="text" size="3" name="cardIssue" id="cardIssue" />
						   </li>
	
					  </ol>
					</fieldset>

<p class="cart_navigation">
	<a href="{$base_dir_ssl}order.php?step=3" class="button_large">{l s='Other payment methods' mod='ccpayment'}</a>
	<input type="submit" name="paymentSubmit" value="{l s='Submit Order' mod='ccpayment'}" class="exclusive_large" />
</p>
</form>