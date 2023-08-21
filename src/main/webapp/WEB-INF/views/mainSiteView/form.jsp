<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../headFootSite/header.jsp" %>
<section class="form--steps">
    <body>
    <header class="header--form-page">

        <div class="slogan container container--90">
            <div class="slogan--item">
                <h1>
                    Give away things you no longer want<br/>
                    <span class="uppercase">to those in need</span>
                </h1>

                <div class="slogan--steps">
                    <div class="slogan--steps-title">4 simple steps are enough:</div>
                    <ul class="slogan--steps-boxes">
                        <li>
                            <div><em>1</em><span>Choose things</span></div>
                        </li>
                        <li>
                            <div><em>2</em><span>Pack them</span></div>
                        </li>
                        <li>
                            <div><em>3</em><span>Decide who you want to help</span></div>
                        </li>
                        <li>
                            <div><em>4</em><span>Order a courier</span></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <section class="form--steps" id="scrollTarget">
        <div class="form--steps-instructions">
            <div class="form--steps-container">
                <h3>Important!</h3>
                <p data-step="1" class="active">
                    Fill in the details of your items. This will help us
                    know to whom it is best to donate them.
                </p>
                <p data-step="2">
                    Fill in the details of your items. This will help us
                    know to whom it is best to donate them.
                </p>
                <p data-step="3">
                    Choose one
                    where your shipment will go.
                </p>
                <p data-step="4">Specify the address and the date of collection of the item.</p>
            </div>
        </div>

        <div class="form--steps-container">
            <div class="form--steps-counter">Step <span>1</span>/4</div>

            <form:form method="post" modelAttribute="donation">
                <!-- STEP 1: class .active is switching steps -->
                <div data-step="1">
                    <h3>Mark what you want to give away:</h3>
                    <form:errors path="categories" cssClass="error"/>
                    <c:forEach items="${categories}" var="category">
                        <div class="form-group form-group--checkbox">
                            <label>
                                <form:checkbox path="categories" value="${category.id}"/>
                                <span class="checkbox"></span>
                                <span class="description">${category.name}</span>
                            </label>
                        </div>
                    </c:forEach>

                    <div class="form-group form-group--buttons">
                        <button type="submit" class="btn next-step">Dalej</button>
                    </div>
                </div>

                <!-- STEP 2 -->
                <div data-step="2">
                    <h3>Enter the number of 60l bags in which you packed your belongings: (there must be a minimum of one)</h3>

                    <div class="form-group form-group--inline">
                        <label>
                            Number of 60l bags:
                            <form:input path="quantity" type="number" step="1" min="1" value="1"/>
                            <form:errors path="quantity" cssClass="error"/>
                        </label>
                    </div>

                    <div class="form-group form-group--buttons">
                        <button type="button" class="btn prev-step">Back</button>
                        <button type="button" class="btn next-step">Next</button>
                    </div>
                </div>

                <!-- STEP 3 -->
                <div data-step="3">
                    <h3>Choose the organization you want to help:</h3>
                    <form:errors path="institution" cssClass="error"/>
                    <c:forEach items="${institutions}" var="institution">
                        <div class="form-group form-group--checkbox">
                            <form:label for="institution${institution.id}" path="institution">
                                <form:radiobutton id="institution${institution.id}" path="institution"
                                                  value="${institution.id}"/>
                                <span class="checkbox radio"></span>
                                <span class="description">
                    <div class="title">${institution.name}</div>
                    <div class="subtitle">
                        Goal and mission: ${institution.description}
                    </div>
                </span>
                            </form:label>
                        </div>
                    </c:forEach>

                    <div class="form-group form-group--buttons">
                        <button type="button" class="btn prev-step">Back</button>
                        <button type="button" class="btn next-step">Next</button>
                    </div>
                </div>

                <!-- STEP 4 -->
                <div data-step="4" id="step4">
                    <h3>Enter the address and the date when the courier will pick up the item:</h3>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Collection address</h4>
                            <div class="form-group form-group--inline">
                                <form:label path="street"> Street </form:label>
                                <form:input path="street" type="text"/>
                                <form:errors path="street" cssClass="error"/>
                            </div>

                            <div class="form-group form-group--inline">
                                <form:label path="city"> City </form:label>
                                <form:input path="city" type="text"/>
                                <form:errors path="city" cssClass="error"/>
                            </div>

                            <div class="form-group form-group--inline">
                                <form:label path="zipCode">Zip Code </form:label>
                                <form:input path="zipCode" type="text"/>
                                <form:errors path="zipCode" cssClass="error"/>
                            </div>
                        </div>
                            <div class="form-section--column">
                                <h4>Pick up date</h4>
                                <div class="form-group form-group--inline">
                                    <form:label path="pickUpDate"> Date </form:label>
                                    <form:input path="pickUpDate" type="date"/>
                                    <form:errors path="pickUpDate" cssClass="error"/>
                                </div>


                            <div class="form-group form-group--inline">
                                <form:label path="pickUpTime"> Time </form:label>
                                <form:input path="pickUpTime" type="time"/>
                                <form:errors path="pickUpTime" cssClass="error"/>
                            </div>

                            <div class="form-group form-group--inline">
                                <form:label path="pickUpComment"> comments for the courier (optional) </form:label>
                                <form:textarea path="pickUpComment" rows="5"/>
                                <form:errors path="pickUpComment" cssClass="error"/>
                                <form:input path="user.id" type="hidden" value="${userId}"/>
                            </div>

                    </div>
                    <div class="form-group form-group--buttons">
                        <button type="button" class="btn prev-step">Back</button>
                        <button type="button" class="btn next-step">Next</button>
                    </div>
                </div>
                </div>
                <!-- STEP 5 -->
                <div data-step="5">
                    <h3>Summary of your donation</h3>

                    <div class="summary">
                        <div class="form-section">
                            <h4>Donated:</h4>
                            <ul>
                                <li>
                                    <span class="icon icon-bag"></span>
                                    <span class="summary--text" id="bagsSummary"></span
                                    >
                                </li>

                                <li>
                                    <span class="icon icon-hand"></span>
                                    <span class="summary--text" id="institutionSummary"></span>
                                </li>
                            </ul>
                        </div>

                        <div class="form-section form-section--columns">
                            <div class="form-section--column">
                                <h4>Pickup address:</h4>
                                <ul>
                                    <li><span class="summary--text" id="addressSummary"></span></li>
                                </ul>
                            </div>

                            <div class="form-section--column">
                                <h4>Pickup date:</h4>
                                <ul>
                                    <li><span class="summary--text" id="pickupSummary"></span></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="form-group form-group--buttons">
                        <button type="button" class="btn prev-step">Back</button>
                        <button type="submit" class="btn">Confirmation</button>
                    </div>
                </div>

            </form:form>
        </div>
    </section>


    <%@ include file="../headFootSite/footer.jsp" %>%>