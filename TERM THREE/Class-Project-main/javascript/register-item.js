// Lakshay code start from here

function showError(errorElement, errorMessage) {
    document.querySelector("." + errorElement).classList.add("display-error");
    document.querySelector("." + errorElement).innerHTML = errorMessage;

}

function clearError() {
    let errors = document.querySelectorAll(".error");
    for (let error of errors) {
        error.classList.remove("display-error");
    }
}

const currentPagePath = window.location.pathname;

// For Register item starts from here 

try {
    let form = document.forms['register-item-form'];

form.onsubmit = function (event) {

    clearError();

    if (form.Name.value == "") {
        showError("name-error", "you have not enter your name ");
        return false
    }

    if (form.Model.value == "") {
        showError("model-error", "you have not enter your model ")
        return false
    }

    if (form.Vin.value == "") {
        showError("vin-error", "you have not enter your Vin number ")
        return false
    }

    if (form.Color.value === "a") {
        showError("color-error", "Please select a color.");
        return false
    }
    if (form.Manufacture.value === "a") {
        showError("manufacture-error", "Please select a manufacture.");
        return false
    }

    event.preventDefault()

    console.log("Before redirection");

    window.location.href = "../pages/register-repair.html";
}
} catch (error) {
    console.error("An error occurred:", error);
}

// For Register item end here

//add item
try {
    let form = document.forms['add-item-form'];

form.onsubmit = function (event) {

    clearError();

    if (form.Name.value == "") {
        showError("name-error", "you have not enter your name ");
        return false
    }

    if (form.Model.value == "") {
        showError("model-error", "you have not enter your model ")
        return false
    }

    if (form.Vin.value == "") {
        showError("vin-error", "you have not enter your Vin number ")
        return false
    }

    if (form.Color.value === "a") {
        showError("color-error", "Please select a color.");
        return false
    }
    if (form.Manufacture.value === "a") {
        showError("manufacture-error", "Please select a manufacture.");
        return false
    }

    event.preventDefault()

    console.log("Before redirection");

    window.location.href = "../pages/details-customers.html";
}
} catch (error) {
    console.error("An error occurred:", error);
}
//add item end here



// For Register Customer starts from here 

try {
    let customer = document.forms['customer-form'];

customer.onsubmit = function (event) {
    clearError();

    if (customer.fName.value == "") {
        showError("fname-error", "First name required ");
        return false
    }
    if (customer.lName.value == "") {
        showError("lname-error", "Last name required ");
        return false
    }
    if (customer.Email.value == "") {
        showError("email-error", "Email required ");
        return false
    }
    if (customer.telephone.value == "") {
        showError("telephone-error", "Phone number required ");
        return false
    }
    if (customer.Provinces.value == "a") {
        showError("provinces-error", "Provinces required ");
        return false
    }
    if (customer.City.value == "a") {
        showError("city-error", "City required ");
        return false
    }
    if (customer.Address.value == "") {
        showError("address-error", "Address required ");
        return false
    }
    if (customer.Code.value == "") {
        showError("code-error", "Code required ");
        return false
    }

    event.preventDefault()

    console.log("Before redirection");

    window.location.href = "../pages/register-item.html";
}
} catch (error) {
    console.error("An error occurred:", error);
}

// For Register Customer end here


// For adding manufacturer starts from here 

try {
    let manufacturer = document.forms['manufacturer-form'];

    manufacturer.onsubmit = function (event) {
        clearError();
        if (manufacturer.mname.value == "") {
            showError("mname-error", "Manufacturer name required ");
            return false
        }
        event.preventDefault()

        console.log("Before redirection");

        window.location.href = "../pages/configuration-manufacturers.html";
    }

    
} catch (error) {
    console.error("An error occurred:", error);
}
// For adding manufacturer end here 

//for adding color start here
try {
    let color = document.forms['color-form'];

    color.onsubmit = function (event) {
        clearError();
        if (color.colname.value == "") {
            showError("colname-error", "color name required ");
            return false
        }
        event.preventDefault()


        window.location.href = "../pages/configuration-colors.html";
    }

    
} catch (error) {
    console.error("An error occurred:", error);
}

//color end 

//for adding tech start here

try {

    let tech = document.forms['technician-form'];

    tech.onsubmit = function (event) {
        clearError();
        if (tech.prname.value == "") {
            showError("tname-error", "technician name required ");
            return false
        }
        event.preventDefault()


        window.location.href = "../pages/configuration-technician.html";
    }

    
} catch (error) {
    console.error("An error occurred:", error);
}

// tech end here

//repair starts

try {
    let repair = document.forms['repair-form-start'];

    repair.onsubmit = function (event) {
        clearError();
        if (repair.rname.value == "") {
            showError("rname-error", "name of repair required ");
            return false
        }

        if (repair.technicianname.value == "a") {
            showError("tename-error", "technician name required ");
            return false
        }
        if (repair.cname.value == "") {
            showError("cname-error", "cost of repair required ");
            return false
        }
        event.preventDefault()


        window.location.href = "../pages/repair-in-progress.html";
    }

    
} catch (error) {
    console.error("An error occurred:", error);
}
//repair end

//edit starts
try {
    let repair = document.forms['repair-edit'];

    repair.onsubmit = function (event) {
        clearError();
        if (repair.rname.value == "") {
            showError("rname-error", "name of repair required ");
            return false
        }
        if (repair.ename.value == "") {
            showError("ename-error", "equipment name required ");
            return false
        }
        if (repair.technicianname.value == "a") {
            showError("tename-error", "technician name required ");
            return false
        }
        if (repair.cname.value == "") {
            showError("cname-error", "cost of repair required ");
            return false
        }
        event.preventDefault()


        window.location.href = "../pages/repair-list.html";
    }

    
} catch (error) {
    console.error("An error occurred:", error);
}

/* Dark mode */


document.addEventListener('DOMContentLoaded', function () {
    // Check if the user has a preference stored in localStorage
    const isDarkMode = localStorage.getItem('darkMode') === 'true';

    // Apply the saved preference
    if (isDarkMode) {
        document.body.classList.add('dark-mode');
        updateDarkModeSwitchText(true);
    }

    // Add click event listener to the dark mode switch
    document.getElementById('darkModeSwitch').addEventListener('click', function () {
        // Toggle the 'dark-mode' class on the body
        document.body.classList.toggle('dark-mode');

        // Save the user's preference to localStorage
        const isDarkModeNow = document.body.classList.contains('dark-mode');
        localStorage.setItem('darkMode', isDarkModeNow.toString());

        // Update the text content of the switch based on the current dark mode state
        updateDarkModeSwitchText(isDarkModeNow);
    });

    // Function to update the text content of the dark mode switch
    function updateDarkModeSwitchText(isDarkMode) {
        const switchText = document.getElementById('darkModeSwitch').querySelector('p');
        switchText.textContent = isDarkMode ? 'Switch to light' : 'Switch to dark';
    }
});



//Toast
function showToast() {
    // Get the toast container element
    var toastContainer = document.getElementById('toastContainer');

    // Set the message to be displayed

    // Check if the toast is currently visible
    if (toastContainer.style.display === 'block') {
      // If visible, hide the toast container
      toastContainer.style.display = 'none';
    } else {
      // If not visible, update the content and show the toast container
      toastContainer.style.display = 'block';

      // Hide the toast container after 3 seconds (adjust as needed)
      setTimeout(function() {
        toastContainer.style.display = 'none';
      }, 7000);
    }
}