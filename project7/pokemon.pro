% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: pokemon.pro
% --- Line: Just a few facts about pokemon
% -----------------------------------------------------------------------

% -----------------------------------------------------------------------
% --- cen(P) :: Pokemon P was "creatio ex nihilo"

cen(pikachu).
cen(bulbasaur).
cen(caterpie).
cen(charmander).
cen(vulpix).
cen(poliwag).
cen(squirtle).
cen(staryu).

% -----------------------------------------------------------------------
% --- evolves(P,Q) :: Pokemon P directly evolves to pokemon Q

evolves(pikachu,raichu).
evolves(bulbasaur,ivysaur).
evolves(ivysaur,venusaur).
evolves(caterpie,metapod).
evolves(metapod,butterfree).
evolves(charmander,charmeleon).
evolves(charmeleon,charizard).
evolves(vulpix,ninetails).
evolves(poliwag,poliwhirl).
evolves(poliwhirl,poliwrath).
evolves(squirtle,wartortle).
evolves(wartortle,blastoise).
evolves(staryu,starmie).

% -----------------------------------------------------------------------
% --- pokemon(name(N),T,hp(H),attach(A,D)) :: There is a pokemon with
% --- name N, type T, hit point value H, and attach named A that does
% --- damage D.

pokemon(name(pikachu), electric, hp(60), attack(gnaw, 10)).
pokemon(name(raichu), electric, hp(90), attack(thunder-shock, 90)).

pokemon(name(bulbasaur), grass, hp(40), attack(leech-seed, 20)).
pokemon(name(ivysaur), grass, hp(60), attack(vine-whip, 30)).
pokemon(name(venusaur), grass, hp(140), attack(poison-powder, 70)).

pokemon(name(caterpie), grass, hp(50), attack(gnaw, 20)).
pokemon(name(metapod), grass, hp(70), attack(stun-spore, 20)).
pokemon(name(butterfree), grass, hp(130), attack(whirlwind, 80)).

pokemon(name(charmander), fire, hp(50), attack(scratch, 10)).
pokemon(name(charmeleon), fire, hp(80), attack(slash, 50)).
pokemon(name(charizard), fire, hp(170), attack(royal-blaze, 100)).

pokemon(name(vulpix), fire, hp(60), attack(confuse-ray, 20)).
pokemon(name(ninetails), fire, hp(100), attack(fire-blast, 120)).

pokemon(name(poliwag), water, hp(60), attack(water-gun, 30)).
pokemon(name(poliwhirl), water, hp(80), attack(amnesia, 30)).
pokemon(name(poliwrath), water, hp(140), attack(dashing-punch, 50)).

pokemon(name(squirtle), water, hp(40), attack(bubble, 10)).
pokemon(name(wartortle), water, hp(80), attack(waterfall, 60)).
pokemon(name(blastoise), water, hp(140), attack(hydro-pump, 60)).

pokemon(name(staryu), water, hp(40), attack(slap, 20)).
pokemon(name(starmie), water, hp(60), attack(star-freeze, 20)).

% --- ^^^ GIVEN CODE ^^^ ---

% --- display_names ---
% --- no param, names of all pokemon
display_names :- pokemon(name(Name),_,_,_), write(Name), nl, fail.

% --- display_attacks ---
% --- no param, names of all attacks
display_attacks :- pokemon(_,_,_,attack(ATK,_)), write(ATK), nl, fail.

% --- powerful ---
% --- 1 param (Name), pokemon has attack > 55 dmg
powerful(Name) :- pokemon(name(Name),_,_,attack(_,DMG)), DMG > 55.

% --- tough ---
% --- 1 param (Name), pokemon has HP > 100
tough(Name) :- pokemon(name(Name),_,hp(HP),_), HP > 100.

% --- type ---
% --- 2 param (Name,Type), pokemon Name has Type
type(Name,Type) :- pokemon(name(Name),Type,_,_).

% --- dump_kind ---
% --- 1 param (Type), all pokemon with Type as element
dump_kind(Type) :- pokemon(name(Name),Type,_,_), write(Name), nl, fail.

% --- display_cen ---
% --- no param, all 'cen' pokemon
display_cen :- cen(Name), write(Name), nl, fail.

% --- family ---
% --- 1 param (Name), Name = cen pokemon, display all evolutions for Name
family(Name) :- evolves(Name,N2),
    write(Name),
    write(' '),
    family(N2).
family(Name) :- evolves(_,Name), 
    \+ evolves(Name,_),
    write(Name).

% --- families ---
% --- no param, all cen pokemon evolution families on new lines
families :- cen(Name), family(Name), nl, fail.

% --- desc_pokemon ---
% --- 1 param(Name), details about a pokemon
desc_pokemon(Name) :- pokemon(name(Name),Type,HP,ATK), write(pokemon(name(Name),Type,HP,ATK)).

% --- lineage ---
% --- 1 param(Name), details of pokemon Name could evolve into, including self
lineage(Name) :- evolves(Name,N2),
    desc_pokemon(Name),
    nl,
    lineage(N2).
lineage(Name) :- evolves(_,Name),
    \+ evolves(Name,_),
    desc_pokemon(Name).