<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="headFootSite/header.jsp" %>
<header class="header--main-page">
    <nav class="container container--70">
    </nav>
    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Start helping!<br/>
                Give unwanted things to trusted hands
            </h1>
        </div>
    </div>
</header>

<section class="stats">
    <div class="container container--85">
        <div class="stats--item">
            <em>${totalQuantity}</em>

            <h3>DEVOTED BAGS</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eius est beatae, quod accusamus illum
                tempora!</p>
        </div>

        <div class="stats--item">
            <em>${donationSize}</em>
            <h3>GIFTS GIVEN</h3>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Laboriosam magnam, sint nihil cupiditate quas
                quam.</p>
        </div>

    </div>
</section>

<section class="steps" id="stepsTarget">
    <h2>4 simple steps are enough</h2>

    <div class="steps--container">
        <div class="steps--item">
            <span class="icon icon--hands"></span>
            <h3>Choose things</h3>
            <p>clothes, toys, equipment and more</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--arrow"></span>
            <h3>Pack them</h3>
            <p>use garbage bags</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--glasses"></span>
            <h3>Decide who you want to help</h3>
            <p>choose a trusted place</p>
        </div>
        <div class="steps--item">
            <span class="icon icon--courier"></span>
            <h3>Order a courier</h3>
            <p>the courier will arrive at a convenient time</p>
        </div>
    </div>

    <a href="${pageContext.request.contextPath}/register" class="btn btn--large">Create an account</a>
</section>

<section class="about-us" id="aboutUsTarget">>
    <div class="about-us--text">
        <h2>About us</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas vitae animi rem pariatur incidunt libero
            optio esse quisquam illo omnis.</p>
        <img src="<c:url value="resources/images/signature.svg"/>" class="about-us--text-signature" alt="Signature"/>
    </div>
    <div class="about-us--image"><img src="<c:url value="resources/images/about-us.jpg"/>" alt="People in circle"/>
    </div>
</section>

<section class="help" id="helpTarget">
    <h2>Who are we helping?</h2>

    <!-- SLIDE 1 -->
    <div class="help--slides active" data-id="1">
        <p>In our database you will find a list of verified Foundations with which we cooperate.
            You can check what they do.</p>

        <ul class="help--slides-items">
            <li>
                <div class="col">
                    <div class="title">${institutions[0].name}</div>
                    <div class="subtitle">Goal and mission: ${institutions[0].description}</div>
                </div>
                <div class="col">
                    <div class="title">${institutions[1].name}</div>
                    <div class="subtitle">Goal and mission: ${institutions[1].description}</div>
                </div>
            </li>
            <li>
                <div class="col">
                    <div class="title">${institutions[2].name}</div>
                    <div class="subtitle">Goal and mission: ${institutions[2].description}</div>
                </div>
                <div class="col">
                    <div class="title">${institutions[3].name}</div>
                    <div class="subtitle">Goal and mission: ${institutions[3].description}</div>
                </div>
            </li>
        </ul>
    </div>
</section>
<%@ include file="headFootSite/footer.jsp" %>
