<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>RevShop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Product card styling */
        .product-card {
            position: relative;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 20px;
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.2);
        }

        .wishlist-heart {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 22px;
            color: #999;
            background: rgba(255, 255, 255, 0.8);
            padding: 5px;
            border-radius: 50%;
            cursor: pointer;
            transition: color 0.3s, background-color 0.3s;
        }

        .wishlist-heart.active {
            color: #ff4b5c;
            background-color: #fff;
        }

        /* Product image */
        .product-card img {
            max-width: 150px;
            margin: 0 auto;
            transition: transform 0.3s ease;
        }

        .product-card img:hover {
            transform: scale(1.05);
        }

        /* Product details */
        .product-details p {
            margin: 0;
            font-size: 16px;
            color: #333;
        }

        .btn-view-details {
            margin-top: 10px;
            padding: 10px 20px;
            border-radius: 30px;
            background-color: #007bff;
            color: white;
            border: none;
            transition: background-color 0.3s ease;
        }

        .btn-view-details:hover {
            background-color: #0056b3;
        }

        /* Category Sidebar */
        .category-sidebar {
            background-color: #f8f9fa;
            padding: 20px;
        }

        .category-sidebar a {
            color: #333;
            font-weight: 500;
            display: block;
            margin: 10px 0;
            text-decoration: none;
            padding: 10px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .category-sidebar a:hover {
            background-color: #007bff;
            color: #fff;
        }

        .search-bar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 60%; /* Increased width for better visibility */
            margin: 0 auto;
        }

        .search-box {
            display: flex;
            border-radius: 50px;
            background-color: #f9f9f9;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            padding: 5px 15px;
            width: 100%;
        }

        .search-input {
            border: none;
            background: transparent;
            padding: 15px;
            font-size: 16px;
            outline: none;
            flex-grow: 1;
            border-radius: 50px;
            color: #333;
        }

        .btn-search {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 50px;
            padding: 10px 20px;
            margin-left: 10px;
            transition: background-color 0.3s ease;
            display: flex;
            align-items: center;
        }

        .btn-search:hover {
            background-color: #0056b3;
        }

        /* Pagination */
        .pagination a {
            padding: 10px 15px;
            border-radius: 50px;
            margin: 0 5px;
            background-color: #007bff;
            font-size : 20px;
            text-decoration : none;
            color: #fff;
            transition: background-color 0.3s ease;
        }

        .pagination a:hover {
            background-color: #0056b3;
            color: #fff;
        }

        .pagination .active {
            background-color: #0056b3;
            color: #fff;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .product-card {
                margin-bottom: 20px;
            }

            .pagination {
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <section>
        <!-- Updated Search Bar -->
        <div class="container-fluid search-bar-container mt-5">
            <div class="row">
                <div class="col-md-12 offset-md-2">
                    <form action="/products" method="get">
                        <div class="input-group search-box">
                            <input type="text" class="form-control search-input" name="ch" placeholder="Search products...">
                            <button class="btn btn-search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- Verification Message (if needed) -->
        <c:if test="${not empty user}">
            <div class="container mt-4">
                <div class="alert alert-info">
                    Welcome back, ${user.name}!
                </div>
            </div>
        </c:if>

        <!-- Main Content -->
        <div class="container-fluid mt-4">
            <div class="row">
                <!-- Category Sidebar -->
                <div class="col-md-2">
                    <div class="category-sidebar">
                        <p class="fs-5">Categories</p>
                        <a href="/products" class="${paramValue == '' ? 'active' : ''}">All</a>
                        <c:forEach var="c" items="${categories}">
                            <a href="/products?category=${c.name}" class="${paramValue == c.name ? 'active' : ''}">${c.name}</a>
                        </c:forEach>
                    </div>
                </div>

                <!-- Products Section -->
                <div class="col-md-10">
                    <div class="row">
                        <c:choose>
                            <c:when test="${empty products}">
                                <div class="col-12 text-center mt-5">
                                    <h3>No products found.</h3>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="p" items="${products}">
                                    <div class="col-md-3 mt-4">
                                        <div class="product-card text-center">
                                            <a href="/user/addWishlist?productId=${p.id}" class="wishlist-heart" onclick="toggleWishlist(this)">
                                                <i class="fas fa-heart"></i>
                                            </a>
                                            <img src="/img/product_img/${p.image}" alt="${p.title}">
                                            <div class="product-details">
                                                <p class="fs-5">${p.title}</p>
                                                <p>&#8377; ${p.discountPrice} <br>
                                                    <span class="text-muted text-decoration-line-through">&#8377; ${p.price}</span>
                                                    <span class="text-success">${p.discount}% off</span>
                                                </p>
                                            </div>
                                            <a href="/product/${p.id}" class="btn btn-view-details">View Details</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Pagination -->
                    <div class="pagination-container mt-4 d-flex justify-content-center">
                        <ul class="pagination">
                            <li class="${isFirst ? 'disabled' : ''}">
                                <a href="/products?pageNo=${pageNo - 1}">&#9666;</a>
                            </li>
                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="${pageNo + 1 == i ? 'active' : ''}">
                                    <a href="/products?pageNo=${i - 1}">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="${isLast ? 'disabled' : ''}">
                                <a href="/products?pageNo=${pageNo + 1}">&#9656;</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <jsp:include page="footer.jsp" />
    <script>
        function toggleWishlist(element) {
            element.classList.toggle("active");
        }
    </script>


</body>
</html>
