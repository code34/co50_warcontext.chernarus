// -----------------------------------------------
// Author: team =[A*C]= code34 nicolas_boiteux@yahoo.fr
// warcontext 
// MISSION TYPE: CONVOY
// -----------------------------------------------
if (!isServer) exitWith{};

	wcmissionauthor = "Donovan";
	wcmissionname = "L'attaque des frelons";
	wcmissiondescription = " Ce jour � 10h30 heure locale, 6 de nos avions de transport vont decoller de la base dans le but d'approvisionner les milices locales basees au nord du pays, qui depuis le debut du conflit nous aide enormement au maintiens de la securite. Vu que cela fait plus de 2 mois qu'ils n'ont pas ete d'approvisionnes, cette aide est plus que vitale.
	Nous venons d'avoir une info de derni�re minute. L'enemi viens d'etre avertis de la route que prendront nos avions ( route normalement sure ), et a disposer en urgence des vehicules �quipes de missiles anti-aeriens pour aneantir notre aide. Notre bataillon a donc ete recrute pour une mission eclair de la plus haute importance. Depart maintenant,soit H ( nous ne pouvons attendre ). Vous n'aurez donc qu'une heure, transport compris, pour localiser ces troupes et leurs vehicules et de les aneantir. Vous vous repartirez en plusieurs groupes afin de localiser le plus rapidement possible les troupes ennemis. Puis regrouper sur zone, puis planification d'une attaque synchronisee afin de limiter les represailles. Attention !!! A H+1h10' le convois d'avions passera au dessus de la zone dangereuse.  En esperant que votre mission de nettoyage soit un succes.";
	wcmissiontarget = "Les frelons";

	_source_position = [wcmaptopright, wcmapbottomleft, "onroad"] call WC_fnc_createposition;
	wcmissionposition = _source_position;

	nil = ["fuelDepot_us", 0, _source_position] spawn EXT_fnc_createcomposition;
	player setpos _source_position;