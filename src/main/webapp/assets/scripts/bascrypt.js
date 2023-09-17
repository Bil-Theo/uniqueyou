var promo = document.getElementById('promo');
var non = document.getElementById('non');
var oui = document.getElementById('oui');

	const myfunc = () => {
	    if (oui.checked) {
	        promo.style.display = 'flex'; // Utilisez 'block' pour afficher l'élément
	    } else {
	        promo.style.display = 'none';
	    }
	}

	// Ajoutez un gestionnaire d'événements pour surveiller les changements dans les boutons radio
	oui.addEventListener('change', myfunc);
	non.addEventListener('change', myfunc);
	
document.addEventListener("DOMContentLoaded", function () {
            var myModal = new bootstrap.Modal(document.getElementById('myModal'), {
                backdrop: 'static',
                keyboard: false
            });

            myModal.show();
        });