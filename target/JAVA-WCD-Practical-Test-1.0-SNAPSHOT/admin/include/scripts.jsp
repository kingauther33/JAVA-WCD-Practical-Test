<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/popper.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


<script>
    // SCRIPTS FOR NAVBAR
    const listLink = document.querySelector("#listLink");
    const createLink = document.querySelector("#createLink");
    const pathname = window.location.pathname.split('/');
    const pathController = pathname[pathname.length - 2];
    const pathAction = pathname[pathname.length - 1]
    if (pathController === 'phone') {
        listLink.innerHTML = 'Phone'
        createLink.innerHTML = "Add new phone"
        listLink.setAttribute('href', '/admin/phone/list');
        createLink.setAttribute('href', '/admin/phone/create');
    } else if (pathController === 'category') {
        listLink.innerHTML = 'Category'
        createLink.innerHTML = "Add new category"
        listLink.setAttribute('href', '/admin/category/list');
        createLink.setAttribute('href', '/admin/category/create');
    }

    if (pathAction === "list") {
        listLink.classList.add('active')
    } else if (pathAction === "create") {
        createLink.classList.add('active')
    }

    // SCRIPTS FOR RESET BUTTON
    const resetButton = document.querySelector("#resetButton");
    const nameInput = document.querySelector("#name");
    const brandInput = document.querySelector("#brand");
    const priceInput = document.querySelector("#price");
    const descriptionInput = document.querySelector("#description");
    resetButton.addEventListener('click', function () {
        nameInput.value = '';
        brandInput.value = 0;
        priceInput.value = '';
        descriptionInput.value = '';
    })

</script>