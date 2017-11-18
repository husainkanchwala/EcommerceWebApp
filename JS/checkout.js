 // Kanchwala, Husain    Account:  jadrn018
 // CS645, Spring 2017
 // Project 1

$(document).ready(function() { 

 	$("#billingform").on("click",function(event) {
 		 if(!validateForm() || !validateValue() ){
   			event.preventDefault();
    	}
   });

    updateCartAmount();
});

function FillBilling(f){
   if(f.billingtoo.checked == true) {
   		 f.sName.value = f.bName.value;
   		 f.sAddress1.value = f.bAddress1.value;
   		 f.sAddress2.value = f.bAddress2.value;
   		 f.sCity.value = f.bCity.value;
   		 f.sState.value = f.bState.value;
   		 f.sZip.value = f.bZip.value;
   		 f.sContact.value = f.bContact.value;

   }
    if(f.billingtoo.checked == false) {
 		 f.sName.value = '';
   		 f.sAddress1.value = '';
   		 f.sAddress2.value = '';
   		 f.sCity.value = '';
   		 f.sState.value = '';
   		 f.sZip.value = '';
   		 f.sContact.value = '';
  }
}

function updateCartAmount(){
    $.post("http://jadran.sdsu.edu/jadrn018/servlet/GetCartAmount",handle_cartamount);      
}

function handle_cartamount(response){
    $("#camount").html(response);
}

function validateValue(){
    var validated="true";
    var regNumber = /^\d+$/;
    $("#adderror2").html("");
    
    if(!regNumber.test($("#sContact").val())){
        validated="false";
       $("#adderror2").html("Contact number must be numeric");     
    }

    if(!regNumber.test($("#bContact").val())){
         validated="false";
        $("#adderror2").html("Contact number must be numeric");     
     }
   
    if(!regNumber.test($("#bCCN").val())){
         validated="false";
        $("#adderror2").html("Credit Card number must be numeric");     
     }

    if(!regNumber.test($("#bSC").val())){
         validated="false";
        $("#adderror2").html("Security code must be numeric");     
     }


  if(validated=="false"){
      return false;
  }else{
      return true;
  }

}

function validateForm(){
    var validated="true";
    var regNumber = /^\d+$/;
    $("#adderror").html("");
    $("#adderror2").html("");
    if($("#bName").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#bAddress1").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#bCity").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#bState").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#bZip").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#bContact").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#bCCT").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#bCCN").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#bSC").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#bCCE").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#sName").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#sAddress1").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#sCity").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#sState").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#sZip").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else if($("#sContact").val()==""){
        validated="false";
       $("#adderror").html("All the fields are mandatory");
    }else{}
    
    if(!regNumber.test($("#sContact").val())){
        validated="false";
       $("#adderror2").html("Contact number must be numeric");     
    }

    if(!regNumber.test($("#bContact").val())){
         validated="false";
        $("#adderror2").html("Contact number must be numeric");     
     }
   
    if(!regNumber.test($("#bCCN").val())){
         validated="false";
        $("#adderror2").html("Credit Card number must be numeric");     
     }

    if(!regNumber.test($("#bSC").val())){
         validated="false";
        $("#adderror2").html("Security code must be numeric");     
     }


	if(validated=="false"){
    	return false;
	}else{
    	return true;
	}
}


