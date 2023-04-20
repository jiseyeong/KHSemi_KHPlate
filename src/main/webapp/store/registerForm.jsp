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
                        <fieldset>
                            <legend>image list</legend>
                            <!-- 여기에 name이 image0, image1 식의 name으로 file input 추가됨. 보내기 직전 name 태그 붙이기 시작. -->
                            <div id="img_field"></div>
                            <input type="text" name="imgLength" style="display: none;">
                        </fieldset>
                        <div class="header">지도 마커 설정</div>
                        <div id="map"></div>
                        <input type="text" id="mapLat" name="mapLat" style="display:none;">
                        <input type="text" name="mapLng" style="display:none;">
                    </form>
                </div>
            </div>

            <script>
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
                    let pos = e.latLng;
                    marker = new kakao.maps.Marker({
                        position: pos
                    });
                    $("input[name=mapLat]").val(pos.toString().split(',')[0].split('(')[1]);
                    $("input[name=mapLng]").val(pos.toString().split(',')[1].split(')')[0]);
                    marker.setMap(map);
                });

            </script>
            <script>
                let imgs = [];
                let imgs_length = 5;
                let imgForms = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
                $("#btn_image_add").click(function () {
                    if (imgs.length < imgs_length) {
                        let div = $("<div>"),
                            fileInput = $("<input type='file' accept='image/*'>");
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
                })
            </script>
        </body>

        </html>