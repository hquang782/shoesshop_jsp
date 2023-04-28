<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dev4fun.model.Product" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<link href="<c:url value="/assets/style/user/product-detail.css"/>" rel="stylesheet" type="text/css"/>

<main>
    <%Product product = (Product) request.getAttribute("product");%>
    <div class="product">
        <div class="product-top">
            <p>Trang chủ</p><span>&#10230;</span>
            <p>Giày Nike</p><span>&#10230;</span>
            <p>Air Force 1</p>
        </div>
        <div class="product-content">
            <div class="product-content-left">
                <div class="product-content-left-big-img">
                    <img src="img/sp1.jpeg" alt="">
                </div>
                <div class="product-content-left-small-img">
                    <img src="img/sp2.jpeg" alt="">
                    <img src="img/sp3.jpeg" alt="">
                    <img src="img/sp4.jpeg" alt="">
                    <img src="img/sp5.jpeg" alt="">
                </div>
            </div>
            <div class="product-content-right">
                <div class="product-content-right-product-name">
                    <h1>AF1 Low White Brown Siêu Cấp</h1>
                    <div class="product-content-right-product-name-danhgia row">
                        <span>Mã sản phẩm: N/A</span>
                        <div class="product-content-right-product-name-danhgia-star">
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>
                            <span><i class="fa-solid fa-star"></i></span>

                        </div>
                        <span style="padding-left: 10px;">(0 đánh giá)</span>
                    </div>

                </div>
                <div class="product-content-right-product-price">
                    <p>500.000<sup>đ</sup></p>
                </div>
                <div class="product-content-right-product-color">
                    <p><span>Màu sắc</span> :Trắng</p>
                </div>
                <div class="product-content-right-product-size">
                    <p style="font-weight: bold; font-size: 18px;">Size:</p>
                    <div class="size">
                        <span>36</span>
                        <span>37</span>
                        <span>38</span>
                        <span>39</span>
                        <span>40</span>
                        <span>41</span>
                        <span>42</span>
                        <span>43</span>
                        <span>44</span>
                    </div>
                </div>
                <div class="quantity">
                    <p style="font-weight: bold;">Số lượng:</p>
                    <div class="quantity-set">
                        <div class="quantity-reduce">
                            <div style="font-weight: bold;">-</div>
                        </div>
                        <div class="quatity-value">
                            <div>1</div>
                        </div>
                        <div class="quantity-increase">
                            <div style="font-weight: bold;">+</div>
                        </div>
                    </div>

                </div>
                <div class="product-content-right-product-button">
                    <div class="product-content-right-product-button-mua">
                        <button>
                            <p>ĐẶT MUA NGAY</p>
                        </button>
                    </div>
                    <div class="product-content-right-product-button-cart">
                        <button>
                            <p>THÊM VÀO GIỎ</p>
                        </button>
                    </div>

                </div>
                <div class="product-content-right-bottom">
                    <div class="product-content-right-bottom-top">
                        &#8744;
                    </div>
                    <div class="product-content-right-bottom-content-big">
                        <div class="product-content-right-bottom-content-title">
                            <div class="product-content-right-bottom-content-title-item thongso">
                                <p>Thông số sản phẩm</p>
                            </div>
                            <div class="product-content-right-bottom-content-title-item mota">
                                <p>Mô tả sản phẩm </p>
                            </div>


                        </div>
                        <div class="product-content-right-bottom-content">
                            <div class="product-content-right-bottom-content-thongso">
                                <p><span style="color: #000
                                        ; font-weight: bold;">Size</span>: 36, 37, 38, 39, 40, 41, 42, 43, 44</p><br>
                                <p><span style="color: #000
                                        ; font-weight: bold;">Loại hàng</span>: Siêu Cấp</p><br>
                                <p><span style="color: #000
                                        ; font-weight: bold;">Thương hiệu</span>: Air force 1</p><br>
                                <p><span style="color: #000
                                        ; font-weight: bold;">Quà tặng</span>:Full box + tax + bill, Tặng tất</p><br>
                            </div>
                            <div class="product-content-right-bottom-content-mota">
                                    <span style="color: #000
                                    ; font-weight: bold;">Giày AF1 Low White Brown Móc Nâu Siêu Cấp</span> với thiết kế đẹp, tinh tế & màu sắc vô
                                cùng dễ phối đồ. Vậy nên đôi giày
                                này trở nên phổ biến, mang tính biểu tượng và được rất nhiều giới trẻ yêu thích.
                                Và nếu bạn cũng là một người đam mê dòng sneaker dễ mang, dễ phố đồ thì không nên bỏ
                                qua mẫu giày siêu phẩm này đâu nhé! Dưới đây là một số hình ảnh của đôi Air Force 1
                                Carbar Móc Nâu tại Genz Sneaker (hàng chuẩn siêu cấp, bản xịn nhất thị trường):
                                <br><br>
                                <img src="img/sp6.jpeg" alt="">
                                <img src="img/sp7.jpeg" alt="">
                                <img src="img/sp8.jpeg" alt="">
                                <img src="img/sp9.jpeg" alt="">
                                <img src="img/sp10.jpeg" alt="">
                                <h1
                                        style="font-size: 25px; font-weight: 700; line-height: 30px;margin: 0px 0px 12.8px; color: #000;">
                                    Những lý do bạn nên mua giày sneaker tại Tyhi Sneaker</h1>
                                <ol class="lido">
                                    <li>Giày chuẩn hàng Trung bản chuẩn nhất, cao cấp nhất thị trường.</li>
                                    <li>Kiểm tra hàng mới thanh toán, đổi trả miễn phí.</li>
                                    <li>Mẫu giày Trends, đẹp, đủ mẫu, đủ size.</li>
                                    <li>Ship COD toàn quốc nhanh chóng.</li>
                                    <li>Bảo hành lên đến 6 tháng.</li>
                                    <li>Giảm ngay 5% khi đặt đôi thứ 2.</li>
                                </ol>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</main>
<!-- product-related -->
<section class="product-related">
    <div class="product-related-title">
        <p>Sản Phẩm Tương Tự</p>
    </div>
    <div class="product-conten-related">
        <div class="product-relate-item">
            <img src="img/sptt1.jpg" alt="">
            <h1>Giày Nike Jordan Panda Cổ Cao Hàng Trung</h1>
            <p style="color: red;">750.00<sup>đ</sup></p>
        </div>
        <div class="product-relate-item">
            <img src="img/sptt2.webp" alt="">
            <h1>Giày Nike Jordan Panda Cổ Cao Hàng Trung</h1>
            <p style="color: red;">750.00<sup>đ</sup></p>
        </div>
        <div class="product-relate-item">
            <img src="img/sptt3.jpg" alt="">
            <h1>Giày Nike Jordan Panda Cổ Cao Hàng Trung</h1>
            <p style="color: red;">750.00<sup>đ</sup></p>
        </div>
        <div class="product-relate-item">
            <img src="img/sptt4.jpg" alt="">
            <h1>Giày Nike Jordan Panda Cổ Cao Hàng Trung</h1>
            <p style="color: red;">750.00<sup>đ</sup></p>
        </div>
        <div class="product-relate-item">
            <img src="img/sptt5.jpeg" alt="">
            <h1>Giày Nike Jordan Panda Cổ Cao Hàng Trung</h1>
            <p style="color: red;">750.00<sup>đ</sup></p>
        </div>
    </div>
</section>

<script type="text/javascript" src="<c:url value="/assets/js/user/product-detail.js"/>"></script>
