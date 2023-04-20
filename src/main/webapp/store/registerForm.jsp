<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Store Register</title>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
            <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=714989160c4bbb672f636a880c6c8328"></script>
            <script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
            <style>
                *{
                    box-sizing: border-box;
                }

                .container_noboot {
                    margin-left: 0;
                    margin-right: 0;
                    max-width: 1920px;
                }

                .sidebar {
                    width: 500px;
                }

                .body {
                    width: 1420px;
                }

                .btn_naked {
                    border: none;
                    background-color: transparent;
                }

                #map {
                    width: 500px;
                    height: 400px;
                }

                .inputHeader{
                    float: left;
                    width: 15%;
                }
                .inputs{
                    float: left;
                    width: 85%;
                }
            </style>
        </head>

        <body>
            <div class="container_noboot">
                <div class="sidebar">

                </div>
                <div class="body">
                    <form id="addForm" action="" method="post" enctype="multipart/form-data">
                        <div class="header">
                            이미지 등록
                            <button type="button" id="btn_image_add" class="btn_naked">+</button>
                        </div>
                        <div class="content">
                            <fieldset>
                                <legend>image list</legend>
                                <!-- 여기에 name이 image0, image1 식의 name으로 file input 추가됨. 보내기 직전 name 태그 붙이기 시작. -->
                                <div id="img_field"></div>
                                <input type="text" name="imgLength" style="display: none;">
                            </fieldset>
                        </div>
                        <div class="header">지도 마커 설정</div>
                        <div class="content">
                            <div id="map"></div>
                            <input type="text" name="mapLat" style="display:none;">
                            <input type="text" name="mapLng" style="display:none;">
                            <input type="text" name="mapDistance" style="display:none;">
                        </div>
                        <div class="header">가게 상세 설정</div>
                        <div class="contente">
                            <fieldset style="overflow: hidden;">
                                <legend>가게 상세 정보 입력</legend>
                                <div class="inputHeader">가게 이름 : </div>
                                <input type="text" class="inputs" name="storeName" placeholder="가게 이름을 입력해주세요.">
                                <div class="inputHeader">가게 주소 : </div>
                                <input type="text" class="inputs" name="storeAddress" placeholder="가게 주소를 입력해주세요.">
                                <div class="header">가게 소개</div>
                                <textarea id="editor" name="storeIntroduction"></textarea>
                            </fieldset>
                        </div>
                        <button type="submit">완료</button>
                    </form>
                </div>
            </div>

            <script>
                //에디터 관리
                ClassicEditor
						.create(document.querySelector("#editor"),{
                            toolbar:['heading', '|', 'bold', 'italic', 'bulletedList', 'numberedList','insertTable', 'blockQuote', 'undo', 'redo', ]
                        })
						.then(function (editor) {
							const toolbarElement = editor.ui.view.toolbar.element;
						})
						.catch(error => { console.error(error) });


                //지도 관리
                let isMapAdded = false;
                let mapContainer = document.getElementById("map");
                let options = {
                    //현재는 학원 좌표인데, 가게 중심 좌표 구해서 해봐야 할 것임.
                    //가게 등록할 때, 마커 등록 시 function(e) -> e.latlan
                    center: new kakao.maps.LatLng(37.567944388923316, 126.98295041529863),
                    level: 3
                };
                let map = new kakao.maps.Map(mapContainer, options);
                let marker = null;
                kakao.maps.event.addListener(map, "click", function (e) {
                	if(marker != null){
                		marker.setMap(null);
                	}
                    if(!isMapAdded){
                        isMapAdded=true;
                    }
                    let pos = e.latLng;
                    marker = new kakao.maps.Marker({
                        position: pos
                    });
                    let lat = pos.toString().split(',')[0].split('(')[1],
                        lng = pos.toString().split(',')[1].split(')')[0];
                    $("input[name=mapLat]").val(lat);
                    $("input[name=mapLng]").val(lng);
                    marker.setMap(map);

                    let dLat = (37.567944388923316 - lat) * (Math.PI/180);
                    let dLng = (126.98295041529863 - lng) * (Math.PI/180);
                    let a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(37.567944388923316 * (Math.PI/180)) * Math.cos(lat * (Math.PI/180)) * Math.sin(dLng/2) * Math.sin(dLng/2);
                    let c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
                    let d = 6371 * c;
                    $("input[name=mapDistance]").val(Math.round(d * 1000));
                });


                //이미지 관리
                let imgs = [];
                let imgs_length = 5;
                let imgForms = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
                $("#btn_image_add").click(function () {
                    if (imgs.length < imgs_length) {
                        let div = $("<div>"),
                            fileInput = $("<input type='file' accept='image/*'>"),
                            btn_cancel = $("<button>");
                        btn_cancel.addClass("btn_naked");
                        btn_cancel.append("x");
                        div.append(fileInput, btn_cancel);
                        $("#img_field").append(div);
                        imgs.push(div);

                        btn_cancel.click(function () {
                            imgs.splice(imgs.indexOf(div), 1);
                            div.remove();
                        });
                    }
                });

                $("#addForm").submit(function (e) {
                    $("input[name=imgLength]").val(imgs.length);
                    for (let i = 0; i < imgs.length; i++) {
                        if (imgs[i].children("input").val() == "" || imgs[i].children("input").val() == null) {
                            alert("이미지 첨부 파일을 빈 상태로 두실 수 없습니다.")
                            return false;
                        } else if (!imgs[i].children("input").val().match(imgForms)) {
                            alert("이미지 파일만 업로드 가능합니다.");
                            return false;
                        }
                        imgs[i].children("input").attr("name", "image" + i);
                    }

                    if(!isMapAdded){
                        alert("마커를 설정해주셔야 합니다.");
                    }
                })
            </script>
        </body>

        </html>