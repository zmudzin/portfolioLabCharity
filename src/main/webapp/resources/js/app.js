document.addEventListener("DOMContentLoaded", function() {

  /**
   * Form Select
   */
  class FormSelect {
    constructor($el) {
      this.$el = $el;
      this.options = [...$el.children];
      this.init();
    }

    init() {
      this.createElements();
      this.addEvents();
      this.$el.parentElement.removeChild(this.$el);
    }

    createElements() {
      // Input for value
      this.valueInput = document.createElement("input");
      this.valueInput.type = "text";
      this.valueInput.name = this.$el.name;

      // Dropdown container
      this.dropdown = document.createElement("div");
      this.dropdown.classList.add("dropdown");

      // List container
      this.ul = document.createElement("ul");

      // All list options
      this.options.forEach((el, i) => {
        const li = document.createElement("li");
        li.dataset.value = el.value;
        li.innerText = el.innerText;

        if (i === 0) {
          // First clickable option
          this.current = document.createElement("div");
          this.current.innerText = el.innerText;
          this.dropdown.appendChild(this.current);
          this.valueInput.value = el.value;
          li.classList.add("selected");
        }

        this.ul.appendChild(li);
      });

      this.dropdown.appendChild(this.ul);
      this.dropdown.appendChild(this.valueInput);
      this.$el.parentElement.appendChild(this.dropdown);
    }

    addEvents() {
      this.dropdown.addEventListener("click", e => {
        const target = e.target;
        this.dropdown.classList.toggle("selecting");

        // Save new value only when clicked on li
        if (target.tagName === "LI") {
          this.valueInput.value = target.dataset.value;
          this.current.innerText = target.innerText;
        }
      });
    }
  }
  document.querySelectorAll(".form-group--dropdown select").forEach(el => {
    new FormSelect(el);
  });

  /**
   * Hide elements when clicked on document
   */
  document.addEventListener("click", function(e) {
    const target = e.target;
    const tagName = target.tagName;

    if (target.classList.contains("dropdown")) return false;

    if (tagName === "LI" && target.parentElement.parentElement.classList.contains("dropdown")) {
      return false;
    }

    if (tagName === "DIV" && target.parentElement.classList.contains("dropdown")) {
      return false;
    }

    document.querySelectorAll(".form-group--dropdown .dropdown").forEach(el => {
      el.classList.remove("selecting");
    });
  });

  /**
   * Switching between form steps
   */
  class FormSteps {
    constructor(form) {
      this.$form = form;
      this.$next = form.querySelectorAll(".next-step");
      this.$prev = form.querySelectorAll(".prev-step");
      this.$step = form.querySelector(".form--steps-counter span");
      this.currentStep = 1;
      this.valid = true;

      this.$stepInstructions = form.querySelectorAll(".form--steps-instructions p");
      const $stepForms = form.querySelectorAll("form > div");
      this.slides = [...this.$stepInstructions, ...$stepForms];

      this.init();
    }

    /**
     * Init all methods
     */
    init() {
      this.events();
      this.updateForm();
    }

    /**
     * All events that are happening in form
     */
    events() {
      // Next step
      this.$next.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          if (this.currentStep === 1) {
            const categoryElements = this.$form.querySelectorAll('input[name="categories"]:checked');
            if (categoryElements.length === 0) {
              // Jeśli nie wybrano żadnej kategorii, zatrzymaj się i wyświetl błąd
              alert("Wybierz co chcesz oddać");
              return;
            }
          }
          if (this.currentStep === 2) {
            const bags = document.getElementById("quantity").value;
            if (bags === "") {
              // Jeśli nie podano liczby worków, zatrzymaj się i wyświetl błąd
              alert("Podaj ilość worków");
              return;
            }
          }
          if (this.currentStep === 3) {
            const institutionElements = this.$form.querySelectorAll('input[name="institution"]:checked');
            if (institutionElements.length === 0) {
              // Jeśli nie podano ilości elementów, zatrzymaj się i wyświetl błąd
              alert("Wybierz fundację, której chcesz przekazać dary");
              return;
            }
          }
          if (this.currentStep === 4) {
            const streetInput = document.querySelector('input[name="street"]');
            const cityInput = document.querySelector('input[name="city"]');
            const zipCodeInput = document.querySelector('input[name="zipCode"]');
            const pickUpDateInput = document.querySelector('input[name="pickUpDate"]');
            const pickUpTimeInput = document.querySelector('input[name="pickUpTime"]');

            const street = streetInput.value.trim();
            const city = cityInput.value.trim();
            const zipCode = zipCodeInput.value.trim();
            const pickUpDate = pickUpDateInput.value.trim();
            const pickUpTime = pickUpTimeInput.value.trim();
            if (street === "" || city === "" || zipCode === "" || pickUpDate === "" || pickUpTime === "") {
              // Wyświetl błąd, jeśli któreś pole jest puste
              alert("Proszę wypełnić wszystkie pola");
              return;
            }
          }

          this.currentStep++;
          this.updateForm();
        });
      });

      // Previous step
      this.$prev.forEach(btn => {
        btn.addEventListener("click", e => {
          e.preventDefault();
          this.currentStep--;
          this.updateForm();
        });
      });

      // Form submit
      this.$form.querySelector("form").addEventListener("submit", e => this.submit(e));
    }

    /**
     * Update form front-end
     * Show next or previous section etc.
     */
    updateForm() {
      this.$step.innerText = this.currentStep;

      // TODO: Validation

      this.slides.forEach(slide => {
        slide.classList.remove("active");

        if (slide.dataset.step == this.currentStep) {
          slide.classList.add("active");
        }
      });

      this.$stepInstructions[0].parentElement.parentElement.hidden = this.currentStep >= 5;
      this.$step.parentElement.hidden = this.currentStep >= 5;

      if (this.currentStep === 5) {
        this.showSummary();
      }
    }

    showSummary() {

      const categoryElements = form.querySelectorAll('input[name="categories"]:checked');
      const selectedCategories = Array.from(categoryElements).map(element => element.parentElement.querySelector('.description').innerText);
      const selectedCategoriesString = selectedCategories.join(', ');

      const bags = document.getElementById("quantity").value;
      const selectedInstitutionRadio = document.querySelector('input[name="institution"]:checked');
      const institutionName = selectedInstitutionRadio.parentNode.querySelector('.title').innerText;
      const street = form.querySelector('input[name="street"]').value;
      const city = form.querySelector('input[name="city"]').value;
      const zipCode = form.querySelector('input[name="zipCode"]').value;
      const pickUpDate = form.querySelector('input[name="pickUpDate"]').value;
      const pickUpTime = form.querySelector('input[name="pickUpTime"]').value;
      const pickUpComment = form.querySelector('textarea[name="pickUpComment"]').value;


      document.getElementById("bagsSummary").innerText ="Ilość worków: "+ bags + " kategorie: "+ selectedCategoriesString+ " w dobrym stanie";
      document.getElementById("institutionSummary").innerText = "Dla fundacji " + institutionName;
      document.getElementById("addressSummary").innerText = `${street}, ${city}, ${zipCode}`;
      document.getElementById("pickupSummary").innerText = `${pickUpDate}, ${pickUpTime}, ${pickUpComment}`;
    }

    submit(e) {
      form.submit()
      // TODO: Submit the form to the server or perform any desired action
    }

  }
  const form = document.querySelector(".form--steps");
  if (form !== null) {
    new FormSteps(form);
  }



});

document.addEventListener("DOMContentLoaded", function() {
  const passwordInput = document.getElementById("password");
  const passwordConfirmInput = document.getElementById("passwordConfirm");
  const registerForm = document.getElementById("registerForm");

  registerForm.addEventListener("submit", function(event) {
    if (passwordInput.value !== passwordConfirmInput.value) {
      event.preventDefault();
      alert("Hasło i potwierdzenie hasła nie są identyczne");
    }
  });
});