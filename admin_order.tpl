<br>
<fieldset >
<legend>
     {l s='Payment Card Information' mod='offlinecardpayment'}
	</legend>
	<div id="info" border: solid red 1px;">
	<table>
	<tr><td>Card Type:</td> <td>{$cardtype}</td></tr>
	<tr><td>Card Holder Name:</td> <td>{$cardHoldername}</td></tr>
	<tr><td>Card Number:</td> <td style="color:red;" >{$cardNumber}</td></tr>
	<tr><td>Card CVC Number:</td> <td style="color:red;" >{$cardCVC}</td></tr>
        <tr><td>Card Expires (mm/yyyy):</td> <td>{$cardExp}</td></tr>
	<tr><td>Card Start (mm/yyyy):</td> <td>{$cardStart}</td></tr>
	<tr><td>Card Issue:</td> <td>{$cardIssue}</td></tr>
	</table>
	</div>
  <input type="button" class="button" onclick="if(confirm('Are You Sure')) window.location = document.location + '&remData=1'" alt="{l s='Remove Creditcard Data' mod='offlinecardpayment'}" value="{l s='Click to Remove Credit Card Data' mod='offlinecardpayment'}" />
 </fieldset>
