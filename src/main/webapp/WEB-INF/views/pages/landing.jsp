<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Landing Page</title>
    <!-- external -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">
    <!-- internal css style-->
    <style>
    #theVideo {
      object-fit: cover;
      width: 100%;
      height: 100%;
      background-color: black;
      position: absolute;
    }
    #video-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 400px;
    }
    #video-container > h1{
      z-index: 1;
      background-color: rgba(255,255,255,.8);
    }
    .hr-thick{
      border-top: 3px solid black;
      opacity: 1;
    }
    .section-2 img{
      width: 100%;
      max-height: 300px;
      object-fit: contain;
    }
    </style>
        <link rel="stylesheet" href="styles/style.css">
    <!-- External Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Merriweather:wght@300;400;700&display=swap" rel="stylesheet">
</head>
<body>
<%@include file="../inc/nav.jsp" %>

  <div class='container'>
    <div id='video-container' class="mb-4 shadow-sm position-relative" >
      <h1 class="fw-bold border border-dark border-2 w-50  p-5 text-center">Suspendisse</h1>
      <video playsinline autoplay muted loop poster="${pageContext.request.contextPath}/images/header-image.jpg" id="theVideo">
        <source src="/images/video.mp4" type="video/mp4">
      </video>
    </div>

  <div class='main-content'>
    <div class='section-1 row justify-content-around p-5'>
      <div class='col-12 col-md-4'>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac odio id ipsum malesuada sagittis. Nam a elit molestie, dapibus urna ac, faucibus est. Etiam pharetra mattis ipsum sit amet consectetur.
        </p>
      </div>
      <div class='col-12 col-md-4'>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempus eu ipsum vel sodales. Cras vehicula posuere libero vel vehicula. Vestibulum rutrum eget sapien a sodales. Sed a neque mattis, rutrum lorem eget, ornare justo.
        </p>
      </div>
    </div>
    <hr class='hr-thick'>
    <div class='section-2 row justify-content-around p-5'>

      <div class="col-12 col-md-4">
        <div class="card ">
          <img src="/images/pexels-brigitte-tohm-239581.jpg" class="card-img-top d-block" alt="macarons">
          <div class="card-body">
            <h5 class="card-title text-center">Create New Recipes</h5>
            <p class="card-text">Suspendisse laoreet lacus eu urna blandit condimentum. Morbi facilisis consectetur.</p>
          </div>
        </div>
      </div>
      <div class="col-12 col-md-4">
        <div class="card ">
          <img src="/images/pexels-ella-olsson-3026805.jpg" class="card-img-top d-block" alt="chicken satay">
          <div class="card-body">
            <h5 class="card-title text-center">Meal Planning</h5>
            <p class="card-text">Suspendisse laoreet lacus eu urna blandit condimentum. Morbi facilisis consectetur.</p>
          </div>
        </div>
      </div>
      <div class="col-12 col-md-4">
        <div class="card ">
          <img src="/images/pexels-dzenina-lukac-1583884.jpg" class="card-img-top d-block" alt="french fries">

          <div class="card-body">
            <h5 class="card-title text-center">Food Inventory Management</h5>
            <p class="card-text">Suspendisse laoreet lacus eu urna blandit condimentum. Morbi facilisis consectetur.</p>
          </div>
        </div>
      </div>
    </div>
    <hr class='hr-thick'>
    <div class='section-3 row justify-content-around p-5'>
      <div class='col-12 col-md-4'>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ac odio id ipsum malesuada sagittis. Nam a elit molestie, dapibus urna ac, faucibus est. Etiam pharetra mattis ipsum sit amet consectetur.
        </p>
      </div>
      <div class='col-12 col-md-4'>
        <p>
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempus eu ipsum vel sodales. Cras vehicula posuere libero vel vehicula. Vestibulum rutrum eget sapien a sodales. Sed a neque mattis, rutrum lorem eget, ornare justo.
        </p>
      </div>
    </div>
  </div>
</div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  <script>
    let searchBtn = document.getElementById("search-button")
    let searchBar = document.querySelector("#search")
    console.log(searchBtn)
    searchBtn.addEventListener('click', ()=>{
     console.log("You searched for: " + searchBar.value)
    })
  </script>
</body>
</html>