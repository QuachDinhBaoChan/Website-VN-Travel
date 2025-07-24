<!-- contact-floating.jsp -->
<div class="floating-contact">
  <a href="tel:0123456789" class="contact-icon pulse" target="_blank">
    <img src="images/dienthoai.png" alt="Call">
  </a>
  <a href="https://id.zalo.me/account?continue=https%3A%2F%2Fchat.zalo.me%2Findex.html" class="contact-icon pulse" target="_blank">
    <img src="images/zalo.png" alt="Zalo">
  </a>
  <a href="https://www.facebook.com/groups/512037848808377" class="contact-icon pulse" target="_blank">
    <img src="images/mess.png" alt="Messenger">
  </a>
</div>


<style>
  .floating-contact {
    position: fixed;
    left: 20px;
    bottom: 90px;
    display: flex;
    flex-direction: column;
    gap: 15px;
    z-index: 999;
  }

  .contact-icon {
    width: 50px;
    height: 50px;
    background-color: #ffffff00;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
    position: relative;
    overflow: visible;
  }

  .contact-icon:hover {
    transform: scale(1.1);
  }

  .contact-icon img {
    width: 45px;
    height: 45px;
  }

  /* Hiệu ứng lan tỏa */
  .pulse::before {
    content: "";
    position: absolute;
    width: 100%;
    height: 100%;
    background-color: rgba(255, 102, 0, 0.3); /* Cam mờ */
    border-radius: 50%;
    animation: pulse-animation 1.5s infinite;
    z-index: -1;
  }

  @keyframes pulse-animation {
    0% {
      transform: scale(1);
      opacity: 0.8;
    }
    70% {
      transform: scale(1.8);
      opacity: 0;
    }
    100% {
      transform: scale(1.8);
      opacity: 0;
    }
  }
</style>
