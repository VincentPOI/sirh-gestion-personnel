$(document)
		.ready(
				function() {
					$('#btn').click(function() {
						check();
					});

					$("#formfield").keyup(function(event) {
						if (event.keyCode === 13) {
							check();
						}
					});

					$('#saveBtn').click(function() {
						$('#formfield').submit();
					});

					function check() {
						var cpt = 0;
						$("#ifSecu")
								.text(
										'Le numéro de sécurité sociale est obligatoire');
						$("#ifDate")
								.text(
										'Le numéro de sécurité sociale est obligatoire');
						$("input")
								.each(
										function() {

											if (this.value === "") {
												cpt++;
												$(this).addClass("is-invalid");
											} else {
												$(this).removeClass(
														"is-invalid");

												if (!/^\d{3}$/.test(this.value)
														& this.id === "numSecu") {
													cpt++;
													console.log(this.value);
													$("#ifSecu")
															.text(
																	'le numéro de sécurité sociale doit comporter 15 chiffres');
													$(this).addClass(
															"is-invalid");
												}

												if (!/^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/
														.test(this.value)
														& this.id === "dateNaissance") {
													cpt++;
													console.log(this.value);
													$("#ifDate")
															.text(
																	'la date doit etre au format jj/mm/aaaa');
													$(this).addClass(
															"is-invalid");
												}

											}

										})
						if (cpt == 0) {
							$("#confirm-submit").modal("show");
						}
						$('#name').html($('#nom').val());
						$('#firstName').html($('#prenom').val());
						$('#birthDay').html($('#dateNaissance').val());
						$('#adress').html($('#adresse').val());
						$('#secuNumber').html($('#numSecu').val());

					}
					;

				});
