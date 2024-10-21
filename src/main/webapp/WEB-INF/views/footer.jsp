<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
</head>
<body>
<footer>
    <style>
        /* Footer Container */
        footer {
            background-color: #1a1a1a;
            color: #f1f1f1;
            padding: 40px 0;
            font-family: 'Helvetica Neue', sans-serif;
        }

        .footer-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 0 40px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer-about, .footer-contact, .footer-newsletter, .footer-testimonials {
            margin-bottom: 20px;
        }

        .footer-about h3, .footer-contact h3, .footer-newsletter h3, .footer-testimonials h3 {
            color: #ffffff;
            margin-bottom: 15px;
            font-size: 18px;
        }

        /* About Us */
        .footer-about p {
            color: #cccccc;
            font-size: 14px;
            line-height: 1.6;
        }

        /* Contact Us */
        .footer-contact p, .footer-contact a {
            color: #cccccc;
            font-size: 14px;
        }

        .footer-contact a {
            text-decoration: none;
            color: #f1f1f1;
            transition: color 0.3s ease;
        }

        .footer-contact a:hover {
            color: #ff5733;
        }

        /* Newsletter */
        .footer-newsletter input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: none;
            border-radius: 5px;
            background-color: #333;
            color: #f1f1f1;
        }

        .footer-newsletter button {
            padding: 10px 20px;
            background-color: #ff5733;
            border: none;
            color: #ffffff;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .footer-newsletter button:hover {
            background-color: #cc4526;
        }

        /* Testimonials */
        .footer-testimonials p {
            font-style: italic;
            color: #cccccc;
            font-size: 14px;
            position: relative;
        }

        .footer-testimonials p:before {
            content: "";
            font-size: 30px;
            color: #ff5733;
            position: absolute;
            left: -10px;
            top: -10px;
        }

        /* Footer Bottom */
        .footer-bottom {
            background-color: #111;
            padding: 15px 0;
            text-align: center;
            color: #999999;
            font-size: 12px;
            margin-top: 20px;
        }

        /* Social Icons */
        .footer-social a {
            margin: 0 10px;
            color: #cccccc;
            font-size: 20px;
            transition: color 0.3s ease;
        }

        .footer-social a:hover {
            color: #ff5733;
        }
    </style>

    <div class="footer-container">
        <!-- About Us Section -->
        <div class="footer-about">
            <h3>About Us</h3>
            <p>RevMart is your trusted e-commerce platform, providing high-quality products with a focus on fashion, style, and affordability. We believe in enhancing your shopping experience through great products and excellent customer service.</p>
        </div>

        <!-- Contact Us Section -->
        <div class="footer-contact">
            <h3>Contact Us</h3>
            <p>Email: <a href="mailto:support@revmart.com">support@revmart.com</a></p>
            <p>Phone: <a href="tel:+123456789">+1 234 567 89</a></p>
            <p>Address: G S Raisoni College, Pune, MH</p>
        </div>

        <!-- Newsletter Signup -->
        <div class="footer-newsletter">
            <h3>Subscribe to Our Newsletter</h3>
            <p>Get the latest updates on new products and upcoming sales.</p>
            <form action="/subscribe" method="POST" style="display: flex; flex-direction: column; align-items: center;">
        <input type="email" name="email" placeholder="Enter your email" 
               style="width: 80%; padding: 10px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 5px;">
        <button type="submit" 
                style="padding: 10px 20px; background-color: #ff5733; color: #fff; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease;">
            Subscribe
        </button>
    </form>
        </div>

        <!-- Testimonials Section -->
        <div class="footer-testimonials">
            <h3>What Our Customers Say</h3>
            <p>"RevMart is amazing! I always find the latest trends at great prices. The quality of service is top-notch!"</p>
            <p>"I love the variety of products on RevMart. The delivery is fast, and the customer support is super helpful."</p>
        </div>
    </div>

    <div class="footer-bottom">
        <div class="footer-social">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </div>
        <p>&copy; 2024 RevMart. All Rights Reserved.</p>
    </div>
</footer>

</body>
</html>