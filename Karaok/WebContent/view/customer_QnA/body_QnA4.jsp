<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function update(up) {
		if(up=='del'){
			if (confirm('정말삭제?')){
				location.href = 'qna.ok?action=delete&num=${dto.num }';
			}
		}else{
			document.view.submit();
		}
	}
</script>


<!--  abc{스타일}   ===> 문서내에서 <abc>태그에 스타일 적용
     .abc{스타일}    ===> 문서내에서 <div class="abc">태그에 스타일 적용
     #abc{스타일}     ===> 문서내에서 <abc id="abc">태그에 스타일 적용 -->
  <style type="text/css">
     .reply{
        border: 1px solid red;
     }
  </style>
  <script type="text/javascript" src="/Karaok/js/ajax2.js"></script>
  <script type="text/javascript">
    //댓글 등록 작업 : addReply, addResult
    function addReply(){//댓글 등록 요청
       var name = document.addForm.name.value;	
       var content = document.addForm.content.value;	
       var params="name="+name+"&content="+content; //"name=길동&content=안녕"
       new ajax.xhr.Request("add.ok", params, addResult, 'POST');	
    }//addReply
    function addResult(xhr){//등록요청후 실행할 콜백함수
       if(xhr.readyState==4){
    	  if(xhr.status==200){
    		  var msg = xhr.responseText;
    		  alert(msg.trim());
    		  
    		  loadReplyList();
    		  
    		  document.addForm.name.value='';
    		  document.addForm.content.value='';
    		  document.addForm.name.focus();
    	  }
       }	
    }//addResult  
    
    function updateReply(){//댓글 수정 요청
       var no = document.updateForm.no.value;	
       var name = document.updateForm.name.value;	
       var content = document.updateForm.content.value;	
       
       var params="no="+no+"&name="+name+"&content="+content; 
           //"no=3&name=길동&content=안녕"
       new ajax.xhr.Request("update.ok", params, updateResult, 'POST');	
    }//updateReply
    
    function updateResult(xhr){//수정요청후 실행할 콜백함수
       if(xhr.readyState==4){
    	  if(xhr.status==200){
    		  var msg = xhr.responseText;
    		  alert(msg.trim());
    		  hideUpdateForm();//수정폼 숨기기
    		  
    		  loadReplyList();//변경된 내용 목록 재요청 		 
    	  }
       }	
    }//updateResult  
    
    function deleteReply(no){//댓글 삭제요청
       new ajax.xhr.Request('delete.ok','no='+no,deleteResult,'POST');	
    }
    function deleteResult(xhr){//삭제요청후 콜백
       if(xhr.readyState==4){
    	 if(xhr.status==200){
    		 alert( xhr.responseText );//삭제 성공여부 출력
    		 
    		 loadReplyList();//변경된 내용 목록 재요청 	
    	 }else{
    		 alert('서버에러:'+xhr.status)
    	 }  
       } 
    }
    
    
    function loadReplyList(){//목록요청
       new ajax.xhr.Request('list.ok',null,loadReplyResult);
    }//loadReplyList
    
    function loadReplyResult(xhr){//콜백: 목록출력
       if(xhr.readyState==4){
    	 if(xhr.status==200){
    		var list = eval('('+xhr.responseText+')');
    		//[{no:1,name:'길동',content:'내용'},{},{}] 
    	    //list ---> 배열객체
    	    var replyList = document.getElementById('replyList');
    	    
    	    
    	    //이전 자식노드 삭제
    	    var divList = replyList.childNodes;
    	    //alert('자식수: '+ divList.length)
    	    /* for(var i=0; i<divList.length; i++){    	    	
    	    	replyList.removeChild(replyList.firstChild); 	    	
    	    } */   	    
    	    while(replyList.hasChildNodes()){
    	      replyList.removeChild(replyList.firstChild);
    	    }
    	    
    	    //alert('삭제후 자식수: '+ divList.length)
    	    
    	    
    	    for(var i=0; i<list.length; i++){
    	    	var replyDiv = makeReplyView(list[i]);
    	        replyList.appendChild(replyDiv);
    	    }
    	    //alert('추가후 자식수: '+ divList.length)
    	 }else{
    		 alert('서버에러:'+xhr.status)
    	 }  
       }	
    }//loadReplyResult
    
    function viewUpdateForm(no){//수정폼 보이기
       var replyDiv = document.getElementById("r"+no);//댓글div
       var upFormDiv = document.getElementById("replyUpdate");//수정폼div
       
       //댓글<div>태그에 정의된 reply(JSON)객체 얻기
       var reply = replyDiv.reply;
       
       alert('reply.no='+reply.no);
       alert('document.updateForm='+document.updateForm);
       alert('document.updateForm.no='+document.updateForm.no);
       
       document.updateForm.no.value=  reply.no;
       document.updateForm.name.value= reply.name;
       document.updateForm.content.value= reply.content;       
       
       replyDiv.appendChild(upFormDiv);       
       upFormDiv.style.display='';
    }//viewUpdateForm
    
    function hideUpdateForm(){//수정폼 감추기
      var upFormDiv = document.getElementById("replyUpdate");//수정폼div	
      
      var root = document.documentElement;//<html>엘리먼트
      //document.getElementsByTagName('body').item(0); //<body>엘리먼트
      root.appendChild(upFormDiv);
      
      upFormDiv.style.display='none';
      
    }
    
    
    window.onload=function(){
    	loadReplyList();    	
    }    
    
    
    function makeReplyView(reply){//댓글에 대한 <div>태그 생성
    //reply: { no:1, name:'나기롱', content:'Ajax재밌어요~!!' }
      var replyDiv = document.createElement('div');//<div></div>
      replyDiv.setAttribute("id","r"+ reply.no);//<div id="r1"></div>	
      var html =  '<strong>'+reply.name+'</strong><br>'+
               reply.content.replace('/\n/g', '\n<br>')+'<br>'+
 '<input type="button" value="수정" onclick="viewUpdateForm('+reply.no+')">'+
      '<input type="button" value="삭제" onclick="deleteReply('+reply.no+')">';
      replyDiv.innerHTML = html; // <div id="r1">나길롱<br>안녕<br>수정삭제</div>	        
      replyDiv.reply = reply; //replyDiv엘리먼트에 reply JSON객체저장
      replyDiv.className='reply'; //<div id="r1" class="reply">내용</div>
      return replyDiv;
    }//makeReplyView
  </script>




<form role="form" action="qna.ok?action=edit&num=${dto.num }" method="post" name="view">
   <div class="container">
      <div class="row row-offcanvas row-offcanvas-center">
         <div class="row">
         <div class="box-body">
            <div align="center">
               <h3>1대1 질문 현황</h3>
               <hr>
                 
               <table cellpadding="5" class="table table-bordered table-striped">
                <tr>
                   <th width="20%" bgcolor="#949494">글번호</th>
                   <th>${dto.num }</th>
                </tr>
                <tr>
                   <th width="20%" bgcolor="#cccccc">제목</th>
                   <th>${dto.subject }</th>
                </tr>
                <tr>
                   <th width="20%" bgcolor="#949494">작성자</th>
                   <th>${dto.nickname }</th>
                </tr>
                <tr>
                   <th bgcolor="#ccccc">날짜</th>
                   <th>${dto.ndate }</th>
                </tr>
                <tr>
                   <td colspan="2" height="250pt">${dto.contents }</td>
                </tr>
               <tr>
                  <td colspan="2" align="center">
                  
                     <button type="submit" class="btn btn-primary" onclick="update('up')">수정</button>
                     <button  type="button" class="btn btn-primary" onclick="update('del')">삭제</button>
               		 <button type="reset" class="btn btn-primary" onclick="location.href='qlist.ok'">목록</button>        
                     
                  </td>
                </tr>
               </table>

               </form>
            </div>
            </div>
             </div><!--/row-->
      </div>
   </div>
   <!-- 댓글 목록 출력 -->
  <div id="replyList"></div>
  
  <!-- 댓글 입력폼 -->
  <div id="replyAdd">
     <form name="addForm">
         이름: <input type="text" name="name" size="10"><br>
         내용: <textarea rows="2" cols="20" name="content"></textarea><br>
       <input type="button" value="등록" onclick="addReply()">
     </form>  
  </div>
  
  <!-- 댓글 수정폼 -->
  <div id="replyUpdate" style="display:none">
     <form name="updateForm">
       <input type="hidden" name="no">
         이름: <input type="text" name="name" size="10"><br>
         내용: <textarea rows="2" cols="20" name="content"></textarea><br>
       <input type="button" value="등록" onclick="updateReply()">
       <input type="button" value="취소" onclick="hideUpdateForm()">
     </form>    
  </div>
                </div>
            </div>
        </div> 