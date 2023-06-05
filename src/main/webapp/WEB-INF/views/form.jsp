<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="headfoot/header.jsp" %>

<body>
<header class="header--form-page">

  <div class="slogan container container--90">
    <div class="slogan--item">
      <h1>
        Oddaj rzeczy, których już nie chcesz<br />
        <span class="uppercase">potrzebującym</span>
      </h1>

      <div class="slogan--steps">
        <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
        <ul class="slogan--steps-boxes">
          <li>
            <div><em>1</em><span>Wybierz rzeczy</span></div>
          </li>
          <li>
            <div><em>2</em><span>Spakuj je w worki</span></div>
          </li>
          <li>
            <div><em>3</em><span>Wybierz fundację</span></div>
          </li>
          <li>
            <div><em>4</em><span>Zamów kuriera</span></div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</header>

<section class="form--steps">
  <div class="form--steps-instructions">
    <div class="form--steps-container">
      <h3>Ważne!</h3>
      <p data-step="1" class="active">
        Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
        wiedzieć komu najlepiej je przekazać.
      </p>
      <p data-step="2">
        Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
        wiedzieć komu najlepiej je przekazać.
      </p>
      <p data-step="3">
        Wybierz jedną, do
        której trafi Twoja przesyłka.
      </p>
      <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
    </div>
  </div>

  <div class="form--steps-container">
    <div class="form--steps-counter">Krok <span>1</span>/4</div>

    <form:form method="post" modelAttribute="donation">
      <!-- STEP 1: class .active is switching steps -->
      <div data-step="1">
        <h3>Zaznacz co chcesz oddać:</h3>

        <c:forEach items="${categories}" var="category">
          <div class="form-group form-group--checkbox">
            <label>
              <form:checkbox path="categories"  value="${category.id}" />
              <form:errors path="categories" cssClass="error"/>
              <span class="checkbox"></span>
              <span class="description" >${category.name}</span>
            </label>
          </div>
        </c:forEach>

        <div class="form-group form-group--buttons">
          <button type="submit" class="btn next-step">Dalej</button>
        </div>
      </div>

      <!-- STEP 2 -->
      <div data-step="2">
        <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

        <div class="form-group form-group--inline">
          <label>
            Liczba 60l worków:
            <form:input path="quantity" type="number" step="1" min="1" value="1"/>
            <form:errors path="quantity" cssClass="error"/>
          </label>
        </div>

        <div class="form-group form-group--buttons">
          <button type="button" class="btn prev-step">Wstecz</button>
          <button type="button" class="btn next-step">Dalej</button>
        </div>
      </div>

      <!-- STEP 3 -->
      <div data-step="3">
        <h3>Wybierz organizacje, której chcesz pomóc:</h3>

        <c:forEach items="${institutions}" var="institution">
          <div class="form-group form-group--checkbox">
            <form:label for="institution${institution.id}" path="institution">
              <form:radiobutton id="institution${institution.id}" path="institution"  value="${institution.id}" />
              <form:errors path="institution" cssClass="error"/>
              <span class="checkbox radio"></span>
              <span class="description">
                    <div class="title" >${institution.name}</div>
                    <div class="subtitle">
                        Cel i misja: ${institution.description}
                    </div>
                </span>
            </form:label>
          </div>
        </c:forEach>

        <div class="form-group form-group--buttons">
          <button type="button" class="btn prev-step">Wstecz</button>
          <button type="button" class="btn next-step">Dalej</button>
        </div>
      </div>

      <!-- STEP 4 -->
      <div data-step="4" id="step4">
        <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

        <div class="form-section form-section--columns">
          <div class="form-section--column">
            <h4>Adres odbioru</h4>
            <div class="form-group form-group--inline">
              <form:label path="street"> Ulica </form:label>
              <form:input path="street" type="text"/>
              <form:errors path="street" cssClass="error"/>
            </div>

            <div class="form-group form-group--inline">
              <form:label path="city"> Miasto </form:label>
              <form:input path="city" type="text" />
              <form:errors path="city" cssClass="error"/>
            </div>

            <div class="form-group form-group--inline">
              <form:label path="zipCode">Kod pocztowy </form:label>
              <form:input path="zipCode" type="text"/>
              <form:errors path="zipCode" cssClass="error"/>
            </div>

            <div class="form-section--column">
              <h4>Termin odbioru</h4>
              <div class="form-group form-group--inline">
                <form:label path="pickUpDate"> Data </form:label>
                <form:input path="pickUpDate" type="date" />
                <form:errors path="pickUpDate" cssClass="error"/>
              </div>
            </div>

            <div class="form-group form-group--inline">
              <form:label path="pickUpTime"> Godzina </form:label>
              <form:input path="pickUpTime" type="time" />
              <form:errors path="pickUpTime" cssClass="error"/>
            </div>

            <div class="form-group form-group--inline">
              <form:label path="pickUpComment"> Uwagi dla kuriera </form:label>
              <form:textarea path="pickUpComment" rows="5"/>
              <form:errors path="pickUpComment" cssClass="error"/>
            </div>
          </div>
        </div>
        <div class="form-group form-group--buttons">
          <button type="button" class="btn prev-step">Wstecz</button>
          <button type="button" class="btn next-step">Dalej</button>
        </div>
      </div>

      <!-- STEP 5 -->
      <div data-step="5">
        <h3>Podsumowanie Twojej darowizny</h3>

        <div class="summary">
          <div class="form-section">
            <h4>Oddajesz:</h4>
            <ul>
              <li>
                <span class="icon icon-bag"></span>
                <span class="summary--text" id="bagsSummary"></span
                >
              </li>

              <li>
                <span class="icon icon-hand"></span>
                <span class="summary--text" id="institutionSummary" ></span>
              </li>
            </ul>
          </div>

          <div class="form-section form-section--columns">
            <div class="form-section--column">
              <h4>Adres odbioru:</h4>
              <ul>
                <li><span class="summary--text" id="addressSummary" ></span> </li>
              </ul>
            </div>

            <div class="form-section--column">
              <h4>Termin odbioru:</h4>
              <ul>
                <li><span class="summary--text" id="pickupSummary" ></span> </li>
              </ul>
            </div>
          </div>
        </div>

        <div class="form-group form-group--buttons">
          <button type="button" class="btn prev-step">Wstecz</button>
          <button type="submit" class="btn">Potwierdzam</button>
        </div>
      </div>
    </form:form>
  </div>
</section>


<%@ include file="headfoot/footer.jsp" %>%>