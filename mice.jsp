<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cẩm Nang Du Lịch Việt Nam</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }

    body {
        margin-top: 80px;
      background-color: #f8f9fa;
      color: #333;
      scroll-behavior: smooth;
    }

    /* Slideshow Banner */
    .slideshow-container {
      position: relative;
      height: 60vh;
      overflow: hidden;
    }

    .slide {
      position: absolute;
      width: 100%;
      height: 100%;
      opacity: 0;
      transition: opacity 1s ease-in-out;
    }

    .slide.active {
      opacity: 1;
    }

    .slide-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .overlay {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: rgba(0, 0, 0, 0.5);
      color: white;
      text-align: center;
      padding: 30px;
      border-radius: 10px;
      max-width: 80%;
    }

    .overlay h1 {
      font-size: 2.5rem;
      margin-bottom: 10px;
    }

    .overlay p {
      font-size: 1.2rem;
    }

    /* Guide Section */
    .guide-section {
      padding: 40px 20px;
      text-align: center;
    }

    .destination-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      margin-top: 30px;
    }

    .destination-card {
      background-color: white;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      transition: transform 0.3s ease;
      cursor: pointer;
    }

    .destination-card:hover {
      transform: scale(1.05);
    }

    .destination-card img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }

    .destination-card h3 {
      padding: 15px;
      font-size: 1.2rem;
    }

    /* Detail Section */
    .detail {
      background-color: white;
      margin: 30px auto;
      padding: 30px;
      width: 80%;
      max-width: 1000px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.2);
      text-align: left;
    }

    .detail img {
      width: 100%;
      max-height: 400px;
      object-fit: cover;
      border-radius: 10px;
      margin-bottom: 20px;
    }

    .detail h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #002B8D;
    }

    .detail h3 {
      margin-top: 20px;
      color: #333;
    }

    .detail p, .detail ul {
      margin-bottom: 15px;
      line-height: 1.6;
    }

    .detail ul {
      list-style-type: disc;
      padding-left: 20px;
    }

    .detail button {
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #002B8D;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      display: block;
      margin-left: auto;
      margin-right: auto;
    }

    /* Comment Section */
    .comment-section {
      margin-top: 30px;
      padding-top: 20px;
      border-top: 1px solid #ccc;
    }

    .comment-section h3 {
      margin-bottom: 15px;
    }

    .comment-section textarea {
      width: 100%;
      height: 100px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      margin-bottom: 10px;
      resize: vertical;
    }

    .comment-section button {
      padding: 10px 20px;
      background-color: #FF6600;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .comment-list {
      margin-top: 20px;
    }

    .comment {
      padding: 10px;
      border-bottom: 1px solid #eee;
    }

    /* Events Section */
    .events-section {
      padding: 40px 20px;
      background-color: #fff;
      text-align: center;
    }

    .event-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      margin-top: 30px;
    }

    .event-card {
      background-color: #f8f9fa;
      border-radius: 10px;
      padding: 15px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .event-card h3 {
      margin-bottom: 10px;
    }

    /* Back to Top Button */
    .back-to-top {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background-color: #002B8D;
      color: white;
      border: none;
      border-radius: 50%;
      width: 50px;
      height: 50px;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      opacity: 0;
      transition: opacity 0.4s;
    }

    .back-to-top.show {
      opacity: 1;
    }

    .hidden {
      display: none;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .overlay h1 {
        font-size: 1.8rem;
      }

      .overlay p {
        font-size: 1rem;
      }

      .detail {
        width: 90%;
      }

      .detail img {
        max-height: 300px;
      }
    }

    h2 {
                       text-align: center;
                                   color: #555;
                                   font-size: 24px;
                                   font-weight: bold;
                                   font-family: Arial, sans-serif;
                                   margin-bottom: 20px;
                                   border-bottom: 3px solid #FF6600;
                                   display: inline-block;
                                   padding-bottom: 5px;
                                   margin-bottom: 40px;

                        }
  /* Events Section */
    .events-section {
      padding: 40px 20px;
      background-color: #fff;
      text-align: center;
    }

    .event-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      margin-top: 30px;
    }

    .event-card {
      background-color: #f8f9fa;
      border-radius: 10px;
      padding: 15px;
      box-shadow: 0 2px 10px rgba(0,0,0,0.1);
      transition: transform 0.3s ease;
      cursor: pointer;
    }

    .event-card:hover {
      transform: scale(1.05);
    }

    .event-image {
      width: 100%;
      height: 150px;
      object-fit: cover;
      border-radius: 8px;
      margin-bottom: 10px;
    }

    .event-card h3 {
      margin-bottom: 10px;
      font-size: 1.2rem;
      color: #333;
    }

    .event-card p {
      font-size: 1rem;
      color: #666;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .event-image {
        height: 120px;
      }
    }
  </style>
</head>
<body>

<jsp:include page="navbar.jsp" />
<jsp:include page="contact-floating.jsp" />

<!-- Slideshow Banner -->
<header class="slideshow-container">
  <div class="slide active">
    <img src="images/vn.png" alt="Vietnam" class="slide-image">
    <div class="overlay">
      <h1>Cẩm Nang Du Lịch Việt Nam</h1>
      <p>Khám phá vẻ đẹp từ Bắc tới Nam</p>
    </div>
  </div>
  <div class="slide">
    <img src="images/dn.png" alt="Da Nang" class="slide-image">
    <div class="overlay">
      <h1>Khám Phá Đà Nẵng</h1>
      <p>Thành phố biển với những cây cầu nổi tiếng</p>
    </div>
  </div>
  <div class="slide">
    <img src="images/hcm.png" alt="Ho Chi Minh" class="slide-image">
    <div class="overlay">
      <h1>Thành Phố Hồ Chí Minh</h1>
      <p>Trái tim sôi động của Việt Nam</p>
    </div>
  </div>
</header>

<!-- Guide Section -->
<section class="guide-section">
  <h2>Địa Điểm Nổi Bật</h2>
  <div class="destination-grid" id="destinationGrid">
    <div class="destination-card" onclick="showInfo('Hà Nội')">
      <img src="images/hn.png" alt="Hà Nội">
      <h3>Hà Nội</h3>
    </div>
    <div class="destination-card" onclick="showInfo('Đà Nẵng')">
      <img src="images/dn2.png" alt="Đà Nẵng">
      <h3>Đà Nẵng</h3>
    </div>
    <div class="destination-card" onclick="showInfo('Hồ Chí Minh')">
      <img src="images/hcm2.png" alt="Hồ Chí Minh">
      <h3>Hồ Chí Minh</h3>
    </div>
    <div class="destination-card" onclick="showInfo('Huế')">
      <img src="images/hue.jpg" alt="Huế">
      <h3>Huế</h3>
    </div>
    <div class="destination-card" onclick="showInfo('Hạ Long')">
      <img src="images/vhl.png" alt="Hạ Long">
      <h3>Vịnh Hạ Long</h3>
    </div>
  </div>
</section>

<!-- Detail Section -->
<section id="detailSection" class="detail hidden">
  <h2 id="locationTitle"></h2>
  <img id="locationImage" src="" alt="">
  <p id="locationDescription"></p>
  <div id="locationDetails"></div>
  <div id="locationMapPlaceholder">
    <p><i class="fas fa-map-marker-alt"></i> Bản đồ vị trí (Tích hợp Google Maps sẽ được thêm sau)</p>
  </div>
  <div class="comment-section">
    <h3>Bình luận & Đánh giá</h3>
    <textarea id="commentInput" placeholder="Để lại bình luận của bạn..."></textarea>
    <button onclick="submitComment()">Gửi bình luận</button>
    <div class="comment-list" id="commentList"></div>
  </div>
  <button onclick="closeInfo()">Đóng</button>
</section>

<!-- Events Section -->
<section class="events-section">
  <h2>Sự Kiện Du Lịch Nổi Bật</h2>
  <a href="https://phaohoaquoctedanang.com/?gad_source=1&gad_campaignid=21360082990&gbraid=0AAAAApo1FuYaohT7rSOKaCwOGZvEf2iwD&gclid=CjwKCAjw9uPCBhATEiwABHN9K_-nzZjzqIw5l5hTBg99_q3-Pnmrq70JeaAvFTzBFLT5gC1jqw8O0BoCkqEQAvD_BwE"><div class="event-grid">
    <div class="event-card">
      <img src="images/ph.png" alt="Lễ Hội Pháo Hoa Đà Nẵng" class="event-image">
      <h3>Lễ Hội Pháo Hoa Đà Nẵng</h3>
      <p>Thời gian: Tháng 6/2025</p>
      <p>Địa điểm: Sông Hàn, Đà Nẵng</p>
    </div></a>
  <a href="https://thuvienphutho.gov.vn/KHAM-PHA-DAT-TO//16-Le-Hoi-den-Hung">
    <div class="event-card">
      <img src="images/dh.png" alt="Lễ Hội Đền Hùng" class="event-image">
      <h3>Lễ Hội Đền Hùng</h3>
      <p>Thời gian: Tháng 3/2025</p>
      <p>Địa điểm: Phú Thọ</p>
    </div></a>
  <a href="https://happybox.vn/tet-nguyen-dan-la-gi-nguon-goc-va-y-nghia-cua-ngay-tet-co-truyen-dan-toc-viet-nam.html">
    <div class="event-card">
      <img src="images/tnd.png" alt="Tết Nguyên Đán" class="event-image">
      <h3>Tết Nguyên Đán</h3>
      <p>Thời gian: Tháng 2/2025</p>
      <p>Địa điểm: Toàn quốc</p>
    </div></a>
  </div>
</section>

<!-- Back to Top Button -->
<button class="back-to-top" onclick="scrollToTop()"><i class="fas fa-chevron-up"></i></button>

<jsp:include page="footer.jsp" />

<script>
  const destinations = {
    "Hà Nội": {
      description: "Hà Nội – thủ đô ngàn năm văn hiến, nơi giao thoa giữa truyền thống và hiện đại.",
      image: "images/hanoi.jpg",
      details: `
        <h3>Lịch sử và Văn hóa</h3>
        <p>Hà Nội là trung tâm văn hóa với hơn 1.000 năm lịch sử, từng là kinh đô của Việt Nam qua nhiều triều đại. Thành phố nổi tiếng với các di tích như Văn Miếu - Quốc Tử Giám, Hoàng Thành Thăng Long, và 36 phố phường cổ.</p>
        <h3>Ẩm thực</h3>
        <p>Ẩm thực Hà Nội phong phú với phở bò, bún chả, bánh cuốn, và cốm làng Vòng. Đừng bỏ qua các quán ăn vỉa hè ở Phố Cổ để trải nghiệm hương vị địa phương.</p>
        <h3>Địa điểm tham quan</h3>
        <ul>
          <li>Hồ Gươm và Đền Ngọc Sơn</li>
          <li>Phố Cổ Hà Nội</li>
          <li>Lăng Chủ tịch Hồ Chí Minh</li>
          <li>Chùa Một Cột</li>
          <li>Văn Miếu - Quốc Tử Giám</li>
        </ul>
        <h3>Mẹo du lịch</h3>
        <p>Thời điểm lý tưởng để ghé thăm là mùa thu (tháng 9-11). Nên thử đi xe đạp hoặc xích lô quanh Phố Cổ để cảm nhận nhịp sống Hà Nội.</p>
      `
    },
    "Đà Nẵng": {
      description: "Đà Nẵng – thành phố đáng sống với những bãi biển tuyệt đẹp và cảnh quan hiện đại.",
      image: "images/danang.jpg",
      details: `
        <h3>Lịch sử và Văn hóa</h3>
        <p>Đà Nẵng là cửa ngõ giao thương quan trọng của miền Trung, mang đậm dấu ấn văn hóa Chăm-pa và hiện đại hóa nhanh chóng. Thành phố nổi tiếng với các cây cầu độc đáo như Cầu Rồng, Cầu Sông Hàn.</p>
        <h3>Ẩm thực</h3>
        <p>Ẩm thực Đà Nẵng hấp dẫn với mì Quảng, bánh tráng cuốn thịt heo, bún chả cá, và hải sản tươi sống. Chợ Cồn và chợ Hàn là nơi lý tưởng để thưởng thức đặc sản.</p>
        <h3>Địa điểm tham quan</h3>
        <ul>
          <li>Biển Mỹ Khê</li>
          <li>Bà Nà Hills</li>
          <li>Cầu Rồng</li>
          <li>Ngũ Hành Sơn</li>
          <li>Bán đảo Sơn Trà</li>
        </ul>
        <h3>Mẹo du lịch</h3>
        <p>Tham quan Đà Nẵng vào mùa hè (tháng 4-8) để tận hưởng biển. Đặt vé sớm cho Bà Nà Hills để tránh đông đúc.</p>
      `
    },
    "Hồ Chí Minh": {
      description: "TP.HCM – đô thị sôi động, trung tâm kinh tế và văn hóa của miền Nam.",
      image: "images/saigon.jpg",
      details: `
        <h3>Lịch sử và Văn hóa</h3>
        <p>TP.HCM, hay còn gọi là Sài Gòn, là thành phố lớn nhất Việt Nam, nổi tiếng với sự pha trộn giữa văn hóa Đông - Tây. Các công trình kiến trúc như Nhà thờ Đức Bà, Bưu điện Thành phố mang dấu ấn thuộc địa Pháp.</p>
        <h3>Ẩm thực</h3>
        <p>Ẩm thực TP.HCM đa dạng với bánh mì, cơm tấm, lẩu mắm, và hủ tiếu. Phố ăn vặt Bùi Viện và chợ Bến Thành là điểm đến không thể bỏ qua.</p>
        <h3>Địa điểm tham quan</h3>
        <ul>
          <li>Nhà thờ Đức Bà</li>
          <li>Dinh Độc Lập</li>
          <li>Chợ Bến Thành</li>
          <li>Phố đi bộ Nguyễn Huệ</li>
          <li>Địa đạo Củ Chi</li>
        </ul>
        <h3>Mẹo du lịch</h3>
        <p>TP.HCM nhộn nhịp quanh năm, nhưng mùa khô (tháng 12-4) là thời điểm lý tưởng. Mang giày thoải mái để khám phá các khu phố đi bộ.</p>
      `
    },
    "Huế": {
      description: "Huế – cố đô mộng mơ, nơi lưu giữ nét đẹp cung đình và văn hóa truyền thống.",
      image: "images/hue.jpg",
      details: `
        <h3>Lịch sử và Văn hóa</h3>
        <p>Huế là kinh đô của triều Nguyễn (1802-1945), nổi tiếng với các di sản UNESCO như Kinh thành Huế, lăng tẩm và nhã nhạc cung đình. Sông Hương và cầu Trường Tiền là biểu tượng của thành phố.</p>
        <h3>Ẩm thực</h3>
        <p>Ẩm thực Huế mang đậm phong cách cung đình với bún bò Huế, bánh bèo, bánh nậm, và chè Huế. Các quán ăn nhỏ ven sông Hương là nơi lý tưởng để thưởng thức.</p>
        <h3>Địa điểm tham quan</h3>
        <ul>
          <li>Kinh thành Huế (Đại Nội)</li>
          <li>Chùa Thiên Mụ</li>
          <li>Lăng Tự Đức</li>
          <li>Sông Hương</li>
          <li>Chợ Đông Ba</li>
        </ul>
        <h3>Mẹo du lịch</h3>
        <p>Thời tiết Huế dễ chịu nhất vào mùa xuân (tháng 2-4). Thuê xe đạp hoặc thuyền rồng trên sông Hương để tận hưởng vẻ đẹp thơ mộng.</p>
      `
    },
    "Hạ Long": {
      description: "Vịnh Hạ Long – di sản thế giới với hàng nghìn đảo đá vôi và cảnh quan hùng vĩ.",
      image: "images/halong.jpg",
      details: `
        <h3>Lịch sử và Văn hóa</h3>
        <p>Vịnh Hạ Long, thuộc tỉnh Quảng Ninh, là di sản thiên nhiên thế giới UNESCO, nổi tiếng với các đảo đá vôi, hang động và làng chài truyền thống. Tương truyền, đây là nơi rồng mẹ hạ xuống bảo vệ đất Việt.</p>
        <h3>Ẩm thực</h3>
        <p>Hải sản tươi sống như tôm, cua, mực là đặc sản của Hạ Long. Chả mực giã tay và bún bề bề là món ăn phải thử.</p>
        <h3>Địa điểm tham quan</h3>
        <ul>
          <li>Hang Sửng Sốt</li>
          <li>Đảo Ti Tốp</li>
          <li>Làng chài Cửa Vạn</li>
          <li>Hang Đầu Gỗ</li>
          <li>Vịnh Bái Tử Long</li>
        </ul>
        <h3>Mẹo du lịch</h3>
        <p>Đi du thuyền là cách tốt nhất để khám phá Hạ Long, đặc biệt vào mùa hè (tháng 5-8). Đặt tour trước để tránh giá cao và đảm bảo chỗ.</p>
      `
    }
  };

  // Slideshow Logic
  let currentSlide = 0;
  const slides = document.querySelectorAll('.slide');
  function nextSlide() {
    slides[currentSlide].classList.remove('active');
    currentSlide = (currentSlide + 1) % slides.length;
    slides[currentSlide].classList.add('active');
  }
  setInterval(nextSlide, 5000);

  // Show Destination Info
  function showInfo(location) {
    const data = destinations[location];
    document.getElementById('locationTitle').textContent = location;
    document.getElementById('locationDescription').textContent = data.description;
    document.getElementById('locationImage').src = data.image;
    document.getElementById('locationDetails').innerHTML = data.details;
    document.getElementById('detailSection').classList.remove('hidden');
    window.scrollTo({ top: document.getElementById('detailSection').offsetTop - 80, behavior: 'smooth' });
  }

  // Close Detail Section
  function closeInfo() {
    document.getElementById('detailSection').classList.add('hidden');
  }

  // Submit Comment
  function submitComment() {
    const commentInput = document.getElementById('commentInput');
    const commentText = commentInput.value.trim();
    if (commentText) {
      const commentList = document.getElementById('commentList');
      const commentDiv = document.createElement('div');
      commentDiv.className = 'comment';
      commentDiv.innerHTML = `<p><strong>Người dùng ẩn danh:</strong> ${commentText}</p>`;
      commentList.appendChild(commentDiv);
      commentInput.value = '';
    }
  }

  // Back to Top
  function scrollToTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  }

  window.addEventListener('scroll', () => {
    const backToTop = document.querySelector('.back-to-top');
    backToTop.classList.toggle('show', window.scrollY > 400);
  });
</script>
</body>
</html>