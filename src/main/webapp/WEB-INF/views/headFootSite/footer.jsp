<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer>
    <div class="contact">
        <h2>Contact us</h2>
        <h3>Contact Form</h3>
        <form class="form--contact" id="contactTarget" action="/sendEmail" method="post">
            <div class="form-group form-group--50"><input type="text" name="name" placeholder="Name"/></div>
            <div class="form-group form-group--50"><input type="text" name="surname" placeholder="Surname"/></div>

            <div class="form-group"><textarea name="message" placeholder="Message" rows="1"></textarea></div>

            <button class="btn" type="submit">Send</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2023</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"><img src="<c:url value="resources/images/icon-facebook.svg"/>"/></a> <a href="#"
                                                                                            class="btn btn--small"><img

             src="<c:url value="resources/images/icon-instagram.svg"/>"/></a>
        </div>
    </div>
</footer>

<script src="<c:url value="resources/js/app.js"/>"></script>

</body>
</html>