// function setActive(thisId, className){
  // //alert(document.getElementById(thisId).className);
  // var nodeArr=document.getElementById("ul_mail_nav").getElementsByTagName("li");
  // //alert(nodeArr.length);
  // for (var i=0;i<nodeArr.length;i++){  	
  	    // //alert("here!");    
        // nodeArr[i].setAttribute("class",""); 
//         
   // }
//    
  // var obj=document.getElementById(thisId);  
  // obj.setAttribute("class",className);  
  // //alert(document.getElementById(thisId).className);
//   
// }

$('.dropdown-toggle').dropdown();

function get_options(group_id) {
              $.ajax({
                          type: "POST",
                          url:'/users/show?current_groupid=' + group_id,
                          data:'text'
                          
                      }
              )
}

