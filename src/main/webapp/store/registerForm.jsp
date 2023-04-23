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
                    height: 500px;
                }

                .mapInfo{
                    width:500px;
                }

                .inputHeader{
                    float: left;
                    width: 20%;
                }
                .inputs{
                    float: left;
                    width: 80%;
                }

                .row-contents{
					overflow: hidden;
				}
				.row-contents>div {
					float: left;
				}
				.row-contents>.c1{
                    width:500px;
				}
				.row-contents>.c2{
                    width:920px;
				}
            </style>
        </head>

        <body>
            <div class="container_noboot">
                <div class="sidebar">

                </div>
                <div class="body">
                    <form id="addForm" action="/register.store" method="post" enctype="multipart/form-data">
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
                        <div class="row-contents">
                            <div class="c1">
                                <div class="header">지도 마커 설정</div>
                                <div class="content">
                                    <div id="map"></div>
                                    <div class="mapInfo" style="overflow:hidden;">
                                        <input type="text" name="mapLat" style="display:none;" readonly>
                                        <input type="text" name="mapLng" style="display:none;" readonly>
                                        <div class="inputHeader">거리(M)</div>
                                        <input type="text" name="mapDistance" class="inputs" readonly>
                                    </div>
                                </div>
                            </div>
                            <div class="c2">
                                <div class="header">가게 상세 설정</div>
                                <div class="content">
                                    <fieldset style="overflow: hidden;">
                                        <legend>가게 상세 정보 입력</legend>
                                        <div class="inputHeader">가게 이름 : </div>
                                        <input type="text" class="inputs" name="storeName" placeholder="가게 이름을 입력해주세요.">
                                        <div class="inputHeader">가게 주소 : </div>
                                        <input type="text" class="inputs" name="storeAddress" placeholder="가게 주소를 입력해주세요.">
                                        <div class="inputHeader">가게 카테고리 : </div>
                                        <select class="inputs" name="storeCategory">
                                            <option>한식</option>
                                            <option>양식</option>
                                            <option>중식</option>
                                            <option>일식</option>
                                            <option>아시안</option>
                                            <option>디저트</option>
                                            <option>음료</option>
                                            <option>패스트푸드</option>
                                            <option>기타</option>
                                        </select>
                                        <div class="header" style="float:left; width:100%;">가게 소개</div>
                                        <div style="float:left; width:100%;">
                                            <textarea id="editor" name="storeIntroduction"></textarea>
                                        </div>
                                    </fieldset>
                                </div>
                            </div>
                        </div>
                        <button class="btn btn-primary" type="submit">완료</button>
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
                        return false;
                    }
                })
            </script>
        </body>

        </html>