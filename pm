<!DOCTYPE html>
<html lang="es">
<head>
  <!-- SEO и OpenGraph -->
  <meta name="description" content="Аренда авто в Марбелье, Малаге и по всему Коста дель Соль. Лучшие цены и премиальные автомобили.">
  <meta name="keywords" content="аренда авто, Marbella, Malaga, прокат машин, люксовые автомобили, аренда автомобилей Коста дель Соль">
  <meta name="author" content="PrestigeMotion">
  <meta property="og:title" content="PrestigeMotion – аренда авто на Коста дель Соль">
  <meta property="og:description" content="Прокат автомобилей в Марбелье, Малаге и других городах побережья. Ferrari, Bugatti, Audi, Mercedes – арендуй прямо сейчас!">
  <meta property="og:image" content="https://cdn.pixabay.com/photo/2022/06/06/14/09/supercar-7246485_1280.jpg">
  <meta property="og:url" content="https://prestigemotion.netlify.app">
  <meta property="og:type" content="website">
  <link rel="icon" type="image/png" href="https://cdn-icons-png.flaticon.com/512/2972/2972185.png">

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PrestigeMotion - Alquiler de coches</title>
  <script src="https://js.stripe.com/v3/"></script>
  <style>
    body { font-family: sans-serif; margin: 0; padding: 0; background: #f8f8f8; }
    header { background: black; color: white; padding: 1em; text-align: center; }
    nav { text-align: center; padding: 1em; background: #222; }
    nav a { color: white; margin: 0 1em; text-decoration: none; font-weight: bold; }
    section { padding: 2em; max-width: 1000px; margin: auto; }
    .car-list { display: flex; flex-wrap: wrap; gap: 1em; justify-content: center; }
    .car { background: white; border-radius: 8px; padding: 1em; width: 280px; box-shadow: 0 0 10px rgba(0,0,0,0.1); text-align: center; }
    .car img { max-width: 100%; height: auto; border-radius: 8px; }
    .lang-switch { text-align: right; padding: 0.5em 1em; background: #eee; }
    .lang-switch a { margin-left: 1em; text-decoration: none; color: #333; font-weight: bold; }
    footer { background: #111; color: white; text-align: center; padding: 1em; }
    .btn { display: inline-block; background: #25d366; color: white; padding: 0.5em 1em; border-radius: 4px; margin-top: 0.5em; text-decoration: none; }
    .booking-form { background: white; padding: 2em; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1); max-width: 600px; margin: auto; margin-top: 2em; }
    .booking-form input, .booking-form select, .booking-form button { width: 100%; padding: 1em; margin-bottom: 1em; border: 1px solid #ccc; border-radius: 5px; }
    .booking-form button { background: black; color: white; font-weight: bold; cursor: pointer; }
  .car-list.transition {
  transition: all 0.3s ease;
}
.car.transition {
  transition: all 0.3s ease;
}
#gridBtn.active, #listBtn.active {
  background: #222 !important;
  color: #fff !important;
}
.car {
  position: relative;
  overflow: hidden;
}
.car img {
  transition: 0.3s ease;
  display: block;
}
.car:hover img {
  filter: brightness(50%);
}
.car .more-info {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: rgba(0, 0, 0, 0.8);
  color: white;
  padding: 0.6em 1.2em;
  border-radius: 5px;
  text-decoration: none;
  opacity: 0;
  transition: opacity 0.3s ease;
  font-weight: bold;
  z-index: 2;
}
.car:hover .more-info {
  opacity: 1;
  backdrop-filter: blur(2px);
  cursor: pointer;
}

  $1
  const cars = {
    "audi-q2": {
      name: "Audi Q2",
      year: "2020",
      transmission: "Автомат",
      description: "Стильный и экономичный кроссовер идеально подходит для города и путешествий.",
      images: [
        "https://cdn.pixabay.com/photo/2019/09/16/20/27/audi-4481880_1280.jpg",
        "https://cdn.pixabay.com/photo/2020/04/06/19/44/audi-5001808_1280.jpg",
        "https://cdn.pixabay.com/photo/2017/01/06/19/15/audi-1957035_1280.jpg"
      ],
      pricing: [
        { label: "7–30 дней", price: "55€" },
        { label: "3–6 дней", price: "60€" },
        { label: "1–2 дня", price: "65€" }
      ]
    },
    "bmw-1": {
      name: "BMW 1 Series",
      year: "2021",
      transmission: "Автомат",
      description: "Премиум-хэтчбек с отличной динамикой и комфортом.",
      images: ["https://cdn.pixabay.com/photo/2016/07/04/21/54/bmw-1490562_1280.jpg"],
      pricing: [
        { label: "7–30 дней", price: "60€" },
        { label: "3–6 дней", price: "65€" },
        { label: "1–2 дня", price: "70€" }
      ]
    },
    "ford-puma": {
      name: "Ford Puma",
      year: "2021",
      transmission: "Автомат",
      description: "Современный компактный кроссовер с большим багажником.",
      images: ["https://cdn.pixabay.com/photo/2021/05/07/21/23/ford-6236266_1280.jpg"],
      pricing: [
        { label: "7–30 дней", price: "45€" },
        { label: "3–6 дней", price: "50€" },
        { label: "1–2 дня", price: "55€" }
      ]
    },
    "toyota-yaris": {
      name: "Toyota Yaris",
      year: "2020",
      transmission: "Автомат",
      description: "Экономичный и надежный городской автомобиль.",
      images: ["https://cdn.pixabay.com/photo/2021/07/25/13/18/toyota-6492472_1280.jpg"],
      pricing: [
        { label: "10–30 дней", price: "40€" },
        { label: "4–9 дней", price: "45€" },
        { label: "1–3 дня", price: "50€" }
      ]
    },
    "golf-gti": {
      name: "Volkswagen Golf GTI",
      year: "2019",
      transmission: "Автомат",
      description: "Заряженный хэтчбек для любителей драйва.",
      images: ["https://cdn.pixabay.com/photo/2020/10/08/09/42/vw-5636623_1280.jpg"],
      pricing: [
        { label: "7–30 дней", price: "55€" },
        { label: "1–6 дней", price: "60€" }
      ]
    },
    "golf-r": {
      name: "Volkswagen Golf R",
      year: "2020",
      transmission: "Автомат",
      description: "Полный привод, максимальная мощность и комфорт.",
      images: ["https://cdn.pixabay.com/photo/2020/10/13/10/07/vw-5650854_1280.jpg"],
      pricing: [
        { label: "7–30 дней", price: "60€" },
        { label: "1–6 дней", price: "65€" }
      ]
    },
    "ferrari": {
      name: "Ferrari",
      year: "2022",
      transmission: "Автомат",
      description: "Легендарный суперкар для ярких эмоций.",
      images: ["https://cdn.pixabay.com/photo/2020/03/04/22/42/ferrari-4902175_1280.jpg"],
      pricing: [
        { label: "5+ дней", price: "250€" },
        { label: "1–4 дня", price: "300€" }
      ]
    },
    "bugatti": {
      name: "Bugatti",
      year: "2022",
      transmission: "Автомат",
      description: "Эталон роскоши и скорости. Идеален для VIP.",
      images: ["https://cdn.pixabay.com/photo/2020/12/05/15/58/bugatti-5806263_1280.jpg"],
      pricing: [
        { label: "5+ дней", price: "450€" },
        { label: "1–4 дня", price: "500€" }
      ]
    },
    "range-rover": {
      name: "Range Rover",
      year: "2021",
      transmission: "Автомат",
      description: "Премиальный внедорожник для комфорта и уверенности.",
      images: ["https://cdn.pixabay.com/photo/2020/07/22/12/15/range-rover-5429474_1280.jpg"],
      pricing: [
        { label: "7–30 дней", price: "100€" },
        { label: "3–6 дней", price: "110€" },
        { label: "1–2 дня", price: "120€" }
      ]
    }
  };
function switchLanguage(lang) {
      document.querySelectorAll('[class^="lang-"]').forEach(el => el.style.display = 'none');
      document.querySelectorAll('.lang-' + lang).forEach(el => el.style.display = 'block');
    }

    async function sendTelegramNotification(formData) {
  const token = '8091080031:AAEB2qKn8pNhj-wjLwySJJyWozPocye9sFs';
  const chatId = '8091080031';
  const message = `Nueva reserva:
Nombre: ${formData.get("name")}
Email: ${formData.get("email")}
Coche: ${formData.get("car")}
Fecha: ${formData.get("date")}
Pago: ${formData.get("payment")}
Documentos: ${formData.get("docOption")}`;

  const url = `https://api.telegram.org/bot${token}/sendMessage`;
  await fetch(url, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ chat_id: chatId, text: message })
  });

  // Отправка файлов, если загружены
  const licenseFile = formData.get("license");
  const passportFile = formData.get("passport");

  if (licenseFile && licenseFile.name) await sendTelegramFile(token, chatId, licenseFile, "driver_license");
  if (passportFile && passportFile.name) await sendTelegramFile(token, chatId, passportFile, "passport");
}

async function sendTelegramFile(token, chatId, file, caption) {
  const url = `https://api.telegram.org/bot${token}/sendDocument`;
  const form = new FormData();
  form.append("chat_id", chatId);
  form.append("caption", caption);
  form.append("document", file);
  await fetch(url, { method: "POST", body: form });
}\nEmail: ${formData.get("email")}\nCoche: ${formData.get("car")}\nFecha: ${formData.get("date")}\nPago: ${formData.get("payment")}`;
      const token = '8091080031:AAEB2qKn8pNhj-wjLwySJJyWozPocye9sFs';
      const chatId = '8091080031';
      const url = `https://api.telegram.org/bot${token}/sendMessage`;
      await fetch(url, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ chat_id: chatId, text: message })
      });
    }

    async function handleFormSubmit(event) {
      event.preventDefault();
      const form = event.target;
      const formData = new FormData(form);

      await sendTelegramNotification(formData);

      // Send email copy
      await fetch('https://formspree.io/f/xeqyydpn', {
        method: 'POST',
        headers: { 'Accept': 'application/json' },
        body: formData
      });

      // Save to Google Sheets
      await fetch('https://script.google.com/macros/s/AKfycbxk8T0AYq7rHdnyGdKqv2_aaOpFG3lL41rrztedHYj4iksnSuvQlNGzVLLz-a_oTaBP/exec', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          name: formData.get("name"),
          email: formData.get("email"),
          car: formData.get("car"),
          date: formData.get("date"),
          payment: formData.get("payment"),
          message: formData.get("message")
        })
      });

      const paymentMethod = formData.get("payment");
      if (paymentMethod === "card") {
        window.location.href = "https://buy.stripe.com/cN2aGt9G3c6K78AfYY"; // замените ссылку на свою Stripe Checkout
      } else {
        alert("Reserva recibida. Le contactaremos pronto.");
        form.reset();
      }
    }
    function sortCars() {
    const sortOption = document.getElementById("sortOption").value;
    const carList = document.getElementById("carList");
    const cars = Array.from(carList.querySelectorAll(".car"));

    cars.sort((a, b) => {
      const nameA = a.querySelector("h3").textContent.toLowerCase();
      const nameB = b.querySelector("h3").textContent.toLowerCase();
      const priceA = parseFloat(a.getAttribute("data-price") || 0);
      const priceB = parseFloat(b.getAttribute("data-price") || 0);

      if (sortOption === "price-asc") return priceA - priceB;
      if (sortOption === "price-desc") return priceB - priceA;
      return nameA.localeCompare(nameB);
    });

    carList.innerHTML = "";
    cars.forEach(car => carList.appendChild(car));
  }
function switchView(mode) {
  const carList = document.getElementById("carList");
  const gridBtn = document.getElementById("gridBtn");
  const listBtn = document.getElementById("listBtn");
  carList.classList.add("transition");

  if (mode === "list") {
    carList.style.flexDirection = "column";
    carList.querySelectorAll(".car").forEach(car => {
      car.style.width = "100%";
      car.classList.add("transition");
    });
    listBtn.classList.add("active");
    gridBtn.classList.remove("active");
  } else {
    carList.style.flexDirection = "row";
    carList.querySelectorAll(".car").forEach(car => {
      car.style.width = "280px";
      car.classList.add("transition");
    });
    gridBtn.classList.add("active");
    listBtn.classList.remove("active");
  }
  localStorage.setItem("carView", mode);
}

document.addEventListener("DOMContentLoaded", () => {
  // Preloader logic
  setTimeout(() => {
    document.getElementById('car-animation').style.opacity = 1;
  }, 2600);
  setTimeout(() => {
    document.getElementById('preloader').style.display = 'none';
  }, 4000);
  const savedView = localStorage.getItem("carView") || "grid";
  switchView(savedView);
}); else {
    carList.style.flexDirection = "row";
    carList.querySelectorAll(".car").forEach(car => car.style.width = "280px");
  }
}
document.addEventListener("DOMContentLoaded", () => {
  const savedCar = localStorage.getItem("scrollToCar");
  if (savedCar) {
    const target = document.querySelector(`.car a[href*='${savedCar}']`);
    if (target) target.scrollIntoView({ behavior: 'smooth', block: 'center' });
    localStorage.removeItem("scrollToCar");
  }
});
</script>
</head>
<body class="lang-es">
<div id="preloader" style="position:fixed;top:0;left:0;width:100vw;height:100vh;background:black;display:flex;justify-content:center;align-items:center;flex-direction:column;z-index:9999;">
  <h1 style="color:white;font-size:3em;font-weight:bold;letter-spacing:3px;animation:fillText 2.5s forwards;">Prestige Motion</h1>
  <div id="car-animation" style="opacity:0;margin-top:40px;transition:all 0.8s ease;">
    <img src="https://cdn-icons-png.flaticon.com/512/743/743922.png" width="100" style="animation:drive 1.5s ease-out forwards;">
  </div>
</div>
<style>
@keyframes fillText {
  0% { color: black; }
  100% { color: white; }
}
@keyframes drive {
  0% { transform: translateX(-150%); }
  100% { transform: translateX(100vw); }
}
</style>
  <div class="lang-switch">
    <a href="#" onclick="switchLanguage('es')">ES</a> |
    <a href="#" onclick="switchLanguage('en')">EN</a> |
    <a href="#" onclick="switchLanguage('ru')">RU</a>
  </div>
  <header>
    <h1>PrestigeMotion</h1>
    <p class="lang-es">Alquiler de coches en Marbella, Málaga y toda la Costa del Sol</p>
    <p class="lang-en" style="display:none;">Car rental in Marbella, Málaga and the entire Costa del Sol</p>
    <p class="lang-ru" style="display:none;">Аренда авто в Марбелье, Малаге и по всему побережью Коста-дель-Соль</p>
  </header>

  <nav>
    <a href="#fleet">Coches / Cars / Авто</a>
    <a href="#about">Sobre Nosotros / About / О нас</a>
    <a href="#contact">Contacto / Contact / Контакты</a>
    <a href="#booking">Reserva / Booking / Бронирование</a>
  </nav>

<section id="fleet">
  <h2 class="lang-es">Nuestros coches</h2>
  <h2 class="lang-en" style="display:none;">Our Cars</h2>
  <h2 class="lang-ru" style="display:none;">Наш автопарк</h2>

  <div style="text-align:center; margin-bottom:20px; display:flex; flex-wrap:wrap; justify-content:center; gap:1em;">
    <div>
      <label for="sortOption"><strong>⬇️ Сортировка:</strong></label><br>
      <select id="sortOption" onchange="sortCars()" style="padding: 0.5em;">
        <option value="">По умолчанию</option>
        <option value="price-asc">По цене (возрастание)</option>
        <option value="price-desc">По цене (убывание)</option>
      </select>
    </div>
    <div>
      <label for="brandFilter"><strong>🔎 Filtrar por marca:</strong></label><br>
      <select id="brandFilter" onchange="filterCars()" style="padding: 0.5em;">
        <option value="all">Все марки</option>
        <option value="Audi">Audi</option>
        <option value="BMW">BMW</option>
        <option value="Mercedes">Mercedes</option>
        <option value="Ford">Ford</option>
        <option value="Toyota">Toyota</option>
        <option value="Volkswagen">Volkswagen</option>
        <option value="Ferrari">Ferrari</option>
        <option value="Bugatti">Bugatti</option>
        <option value="Range Rover">Range Rover</option>
      </select>
    </div>
    <div>
      <label for="modelSearch"><strong>🔍 Поиск по модели:</strong></label><br>
      <input type="text" id="modelSearch" oninput="filterCars()" placeholder="Введите модель" style="padding: 0.5em; width:200px;">
    </div>
  </div>
    <label for="brandFilter"><strong>🔎 Filtrar por marca:</strong></label>
    <select id="brandFilter" onchange="filterCars()" style="padding: 0.5em; margin-left: 10px;">
      <option value="all">Все марки</option>
      <option value="Audi">Audi</option>
      <option value="BMW">BMW</option>
      <option value="Mercedes">Mercedes</option>
      <option value="Ford">Ford</option>
      <option value="Toyota">Toyota</option>
      <option value="Volkswagen">Volkswagen</option>
      <option value="Ferrari">Ferrari</option>
      <option value="Bugatti">Bugatti</option>
      <option value="Range Rover">Range Rover</option>
    </select>
  </div>

  <div style="text-align:center; margin: 1em auto;">
  <button id="gridBtn" onclick="switchView('grid')" style="padding: 0.5em 1em; margin: 0.5em; font-weight: bold;">🔳 Сетка</button>
  <button id="listBtn" onclick="switchView('list')" style="padding: 0.5em 1em; margin: 0.5em; font-weight: bold;">📄 Список</button>
</div>
<div class="car-list" id="carList">
  <div class="car" data-brand="Audi" data-price="65">
    $1
    <a href="car-details.html?car=$1" class="more-info" onclick="localStorage.setItem('scrollToCar', '$1')">Подробнее</a>
    <h3>Audi Q2</h3>
    <div style="text-align:left; font-size:14px; margin:1em 0;">
      <p><strong style="color:#b28c43;">55€/день</strong>: 7–30 дней</p>
      <p><strong style="color:#b28c43;">60€/день</strong>: 3–6 дней</p>
      <p><strong style="color:#b28c43;">65€/день</strong>: 1–2 дня</p>
    </div>
    <p style="font-size:13px; color:#555;"><span>🚗 Модель: 2020</span> &nbsp;&nbsp; ⚙️ Автомат</p>
    <a href="https://wa.me/34635991170" class="btn">Арендовать</a>
  </div>

  <div class="car" data-brand="BMW" data-price="70">
    <img src="https://cdn.pixabay.com/photo/2016/07/04/21/54/bmw-1490562_1280.jpg" alt="BMW 1 Series">
    $1
<a href="car-details.html?car=bmw-1" class="more-info">Подробнее</a>
    <div style="text-align:left; font-size:14px; margin:1em 0;">
      <p><strong style="color:#b28c43;">60€/день</strong>: 7–30 дней</p>
      <p><strong style="color:#b28c43;">65€/день</strong>: 3–6 дней</p>
      <p><strong style="color:#b28c43;">70€/день</strong>: 1–2 дня</p>
    </div>
    <p style="font-size:13px; color:#555;"><span>🚗 Модель: 2021</span> &nbsp;&nbsp; ⚙️ Автомат</p>
    <a href="https://wa.me/34635991170" class="btn">Арендовать</a>
  </div>

  <div class="car" data-brand="Ford" data-price="55">
  <img src="https://cdn.pixabay.com/photo/2021/05/07/21/23/ford-6236266_1280.jpg" alt="Ford Puma">
  $1
<a href="car-details.html?car=ford-puma" class="more-info">Подробнее</a>
  <div style="text-align:left; font-size:14px; margin:1em 0;">
    <p><strong style="color:#b28c43;">45€/день</strong>: 7–30 дней</p>
    <p><strong style="color:#b28c43;">50€/день</strong>: 3–6 дней</p>
    <p><strong style="color:#b28c43;">55€/день</strong>: 1–2 дня</p>
  </div>
  <p style="font-size:13px; color:#555;"><span>🚗 Модель: 2021</span> &nbsp;&nbsp; ⚙️ Автомат</p>
  <a href="https://wa.me/34635991170" class="btn">Арендовать</a>
</div>

<div class="car" data-brand="Toyota" data-price="50">
  <img src="https://cdn.pixabay.com/photo/2021/07/25/13/18/toyota-6492472_1280.jpg" alt="Toyota Yaris">
  $1
<a href="car-details.html?car=toyota-yaris" class="more-info">Подробнее</a>
  <div style="text-align:left; font-size:14px; margin:1em 0;">
    <p><strong style="color:#b28c43;">40€/день</strong>: 10–30 дней</p>
    <p><strong style="color:#b28c43;">45€/день</strong>: 4–9 дней</p>
    <p><strong style="color:#b28c43;">50€/день</strong>: 1–3 дня</p>
  </div>
  <p style="font-size:13px; color:#555;"><span>🚗 Модель: 2020</span> &nbsp;&nbsp; ⚙️ Автомат</p>
  <a href="https://wa.me/34635991170" class="btn">Арендовать</a>
</div>

<div class="car" data-brand="Volkswagen" data-price="60">
  <img src="https://cdn.pixabay.com/photo/2020/10/08/09/42/vw-5636623_1280.jpg" alt="Volkswagen Golf GTI">
  $1
<a href="car-details.html?car=golf-gti" class="more-info">Подробнее</a>
  <div style="text-align:left; font-size:14px; margin:1em 0;">
    <p><strong style="color:#b28c43;">55€/день</strong>: 7–30 дней</p>
    <p><strong style="color:#b28c43;">60€/день</strong>: 1–6 дней</p>
  </div>
  <p style="font-size:13px; color:#555;"><span>🚗 Модель: 2019</span> &nbsp;&nbsp; ⚙️ Автомат</p>
  <a href="https://wa.me/34635991170" class="btn">Арендовать</a>
</div>

<div class="car" data-brand="Volkswagen" data-price="65">
  <img src="https://cdn.pixabay.com/photo/2020/10/13/10/07/vw-5650854_1280.jpg" alt="Volkswagen Golf R">
  $1
<a href="car-details.html?car=golf-r" class="more-info">Подробнее</a>
  <div style="text-align:left; font-size:14px; margin:1em 0;">
    <p><strong style="color:#b28c43;">60€/день</strong>: 7–30 дней</p>
    <p><strong style="color:#b28c43;">65€/день</strong>: 1–6 дней</p>
  </div>
  <p style="font-size:13px; color:#555;"><span>🚗 Модель: 2020</span> &nbsp;&nbsp; ⚙️ Автомат</p>
  <a href="https://wa.me/34635991170" class="btn">Арендовать</a>
</div>

<div class="car" data-brand="Ferrari" data-price="300">
  <img src="https://cdn.pixabay.com/photo/2020/03/04/22/42/ferrari-4902175_1280.jpg" alt="Ferrari">
  $1
<a href="car-details.html?car=ferrari" class="more-info">Подробнее</a>
  <div style="text-align:left; font-size:14px; margin:1em 0;">
    <p><strong style="color:#b28c43;">250€/день</strong>: 5+ дней</p>
    <p><strong style="color:#b28c43;">300€/день</strong>: 1–4 дня</p>
  </div>
  <p style="font-size:13px; color:#555;"><span>🚗 Модель: 2022</span> &nbsp;&nbsp; ⚙️ Автомат</p>
  <a href="https://wa.me/34635991170" class="btn">Арендовать</a>
</div>

<div class="car" data-brand="Bugatti" data-price="500">
  <img src="https://cdn.pixabay.com/photo/2020/12/05/15/58/bugatti-5806263_1280.jpg" alt="Bugatti">
  $1
<a href="car-details.html?car=bugatti" class="more-info">Подробнее</a>
  <div style="text-align:left; font-size:14px; margin:1em 0;">
    <p><strong style="color:#b28c43;">450€/день</strong>: 5+ дней</p>
    <p><strong style="color:#b28c43;">500€/день</strong>: 1–4 дня</p>
  </div>
  <p style="font-size:13px; color:#555;"><span>🚗 Модель: 2022</span> &nbsp;&nbsp; ⚙️ Автомат</p>
  <a href="https://wa.me/34635991170" class="btn">Арендовать</a>
</div>

<div class="car" data-brand="Range Rover" data-price="120">
  <img src="https://cdn.pixabay.com/photo/2020/07/22/12/15/range-rover-5429474_1280.jpg" alt="Range Rover">
  $1
<a href="car-details.html?car=range-rover" class="more-info">Подробнее</a>
  <div style="text-align:left; font-size:14px; margin:1em 0;">
    <p><strong style="color:#b28c43;">100€/день</strong>: 7–30 дней</p>
    <p><strong style="color:#b28c43;">110€/день</strong>: 3–6 дней</p>
    <p><strong style="color:#b28c43;">120€/день</strong>: 1–2 дня</p>
  </div>
  <p style="font-size:13px; color:#555;"><span>🚗 Модель: 2021</span> &nbsp;&nbsp; ⚙️ Автомат</p>
  <a href="https://wa.me/34635991170" class="btn">Арендовать</a>
<div style="text-align:center; margin-top:2em;">
  <a href="#fleet" class="btn">⬅️ Назад к каталогу</a>
</div>
</div>
<!-- Конец автопарка -->
</div>
</section>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll(".car").forEach(car => {
      const price = car.getAttribute("data-price");
      const priceEl = car.querySelector(".car-price");
      if (price && priceEl) priceEl.textContent = price;
    });
  });

  function filterCars() {
  const selectedBrand = document.getElementById("brandFilter").value.toLowerCase();
  const searchQuery = document.getElementById("modelSearch")?.value?.toLowerCase() || "";
  const cars = document.querySelectorAll(".car-list .car");

  cars.forEach(car => {
    const brand = car.getAttribute("data-brand").toLowerCase();
    const model = car.querySelector("h3").textContent.toLowerCase();
    const matchesBrand = selectedBrand === "all" || brand === selectedBrand;
    const matchesSearch = model.includes(searchQuery);
    car.style.display = matchesBrand && matchesSearch ? "block" : "none";
  });
});
  }
</script>

  <section id="booking">
    <h2 class="lang-es">Reservar un coche</h2>
    <h2 class="lang-en" style="display:none;">Book a Car</h2>
    <h2 class="lang-ru" style="display:none;">Забронировать авто</h2>
    <div class="booking-form">
      $1
        <p style="margin-bottom: 1em; font-weight: bold;">📎 Subir documentos:</p>
        <select name="docOption" required style="margin-bottom: 1em;">
          <option value="now">📤 Subir documentos ahora (рекомендуется)</option>
          <option value="later">📁 Загрузить документы при получении авто (может занять больше времени)</option>
        </select>
        <div id="uploadDocs" style="display: none;">
          <label>Фото водительского удостоверения:</label>
          <input type="file" name="license" accept="image/*,application/pdf">
          <label>Фото паспорта:</label>
          <input type="file" name="passport" accept="image/*,application/pdf">
        </div>
        <script>
          document.addEventListener("DOMContentLoaded", function() {
            const docOption = document.querySelector('[name="docOption"]');
            const uploadBlock = document.getElementById("uploadDocs");
            docOption.addEventListener("change", () => {
              uploadBlock.style.display = docOption.value === "now" ? "block" : "none";
            });
          });
        </script>
        <input type="text" name="name" placeholder="Tu nombre / Your name / Ваше имя" required>
        <input type="email" name="email" placeholder="Correo / Email / Почта" required>
        <input type="text" name="car" placeholder="Modelo del coche / Car model / Модель машины" required>
        <input type="date" name="date" required>
        <select name="payment">
          <option value="cash">Pago en efectivo / Pay in cash / Оплата наличными</option>
          <option value="card">Pago con tarjeta / Pay by card / Оплата картой</option>
        </select>
        <textarea name="message" rows="4" placeholder="Mensaje adicional / Extra message / Комментарий"></textarea>
        <button type="submit">Enviar / Send / Отправить</button>
      </form>
    </div>
  </section>

  <footer>
    <p>&copy; 2025 PrestigeMotion. Todos los derechos reservados.</p>
  </footer>

<section id="reviews" style="padding: 2em; max-width: 800px; margin: 40px auto;">
  <h2 style="text-align:center;">⭐ Оставить отзыв</h2>
  <form id="review-form" style="background:#fff; padding:2em; border-radius:10px; box-shadow:0 0 10px rgba(0,0,0,0.1);">
    <input type="text" name="reviewName" placeholder="Ваше имя" required style="width:100%; padding:1em; margin-bottom:1em; border:1px solid #ccc; border-radius:5px;">
    <textarea name="reviewText" placeholder="Ваш отзыв" rows="5" required style="width:100%; padding:1em; margin-bottom:1em; border:1px solid #ccc; border-radius:5px;"></textarea>
    <button type="submit" style="width:100%; padding:1em; background:black; color:white; border:none; border-radius:5px; font-weight:bold;">Отправить отзыв</button>
  </form>
  <div id="review-confirmation" style="display:none; text-align:center; margin-top:1em; color:green; font-weight:bold;">Спасибо за ваш отзыв!</div>
</section>
<div id="public-reviews" style="max-width:800px; margin:20px auto; background:#fff; padding:1em; border-radius:10px; box-shadow:0 0 5px rgba(0,0,0,0.1);">
  <h3 style="text-align:center;">💬 Отзывы клиентов</h3>
  <ul id="review-list" style="list-style:none; padding:0;"></ul>
</div>
<script>
  const reviewForm = document.getElementById("review-form");
  const reviewList = document.getElementById("review-list");

  reviewForm.addEventListener("submit", async function(e) {
    e.preventDefault();
    const name = e.target.reviewName.value;
    const text = e.target.reviewText.value;
    const message = `⭐ Новый отзыв:
Имя: ${name}
Отзыв: ${text}`;

    // Telegram уведомление
    await fetch("https://api.telegram.org/bot8091080031:AAEB2qKn8pNhj-wjLwySJJyWozPocye9sFs/sendMessage", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ chat_id: "8091080031", text: message })
    });

    // Отображение на сайте
    const li = document.createElement("li");
    li.innerHTML = `<strong>${name}</strong><br><em>${text}</em><hr>`;
    reviewList.prepend(li);

    reviewForm.style.display = "none";
    document.getElementById("review-confirmation").style.display = "block";
  });
</script>

<section id="admin-panel" style="padding: 2em; max-width: 800px; margin: 40px auto;">
  <h2 style="text-align:center;">🔐 Admin Login</h2>
  <form id="admin-login" style="background:#fff; padding:2em; border-radius:10px; box-shadow:0 0 10px rgba(0,0,0,0.1);">
    <input type="email" name="adminEmail" placeholder="Email" required style="width:100%; padding:1em; margin-bottom:1em; border:1px solid #ccc; border-radius:5px;">
    <input type="password" name="adminPassword" placeholder="Password" required style="width:100%; padding:1em; margin-bottom:1em; border:1px solid #ccc; border-radius:5px;">
    <button type="submit" style="width:100%; padding:1em; background:black; color:white; border:none; border-radius:5px; font-weight:bold;">Login</button>
  </form>
  <div id="admin-dashboard" style="display:none; margin-top:2em; text-align:center;">
    <h3>📊 Добро пожаловать в панель администратора</h3>
    <p><a href="https://docs.google.com/spreadsheets/d/e/2PACX-1vR9K7uQFVzwzeM-W4abREYYWLqHUAPNf0Lo1KhInHa_WyFeQKSQ9jDQcFu4RdKWZdBMVSWqinvQE8Wx/pubhtml" target="_blank">Открыть Google Таблицу статистики</a></p>
  </div>
</section>

<section id="calendar-panel" style="padding: 2em; max-width: 800px; margin: 40px auto; display: none;">
  <h2 style="text-align:center;">📅 Календарь занятости автомобилей</h2>
  <iframe src="https://calendar.google.com/calendar/embed?src=MDY3ZGI0ZDg0NjgxNWQzMWE5NDIzOWZmMDMyODIzMmIwMmMxYjBiZTZjZjE5NWZmNmRmNThkYTUwZjk5NzU0ZkBncm91cC5jYWxlbmRhci5nb29nbGUuY29t" style="border: 1px solid #ccc" width="100%" height="600" frameborder="0" scrolling="no"></iframe>
</section>

<script>
  let ADMINS = [
    { email: "billionaire.privat@gmail.com", password: "Rich2707" }
  ];

  const loginForm = document.getElementById("admin-login");
  const dashboard = document.getElementById("admin-dashboard");

  loginForm.addEventListener("submit", function(e) {
    e.preventDefault();
    const email = loginForm.adminEmail.value;
    const pass = loginForm.adminPassword.value;
    const isAdmin = ADMINS.some(admin => admin.email === email && admin.password === pass);
    if (isAdmin) {
    document.getElementById("calendar-panel").style.display = "block";
      loginForm.style.display = "none";
      dashboard.style.display = "block";
    } else {
      alert("Доступ запрещён. Неверный логин или пароль.");
    }
  });
</script>



  
</body>
</html>


