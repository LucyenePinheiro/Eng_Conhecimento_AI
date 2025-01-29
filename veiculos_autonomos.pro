:- set_prolog_flag(encoding, utf8).

% Fatos sobre sintomas
sintoma(falha_ignicao).
sintoma(luz_check_engine).
sintoma(luz_bateria).
sintoma(barulho_motor).

% Fatos sobre causas
causa(falha_ignicao, bateria_fraca).
causa(falha_ignicao, vela_ignicao_defeituosa).
causa(falha_ignicao, sensor_virabrequim_defeituoso).

causa(luz_check_engine, sensor_oxigenio_defeituoso).
causa(luz_check_engine, problema_injecao).
causa(luz_check_engine, tampa_tanque_solta).

causa(luz_bateria, alternador_defeituoso).
causa(luz_bateria, correia_acessorios_rompida).
causa(luz_bateria, bateria_descarrregada).

causa(barulho_motor, baixo_nivel_oleo).
causa(barulho_motor, problema_escapamento).
causa(barulho_motor, rolamento_danificado).

% Regras para probabilidade
probabilidade(bateria_fraca, alta) :-
    sintoma(falha_ignicao),
    not(bateria_recarregada).

probabilidade(vela_ignicao_defeituosa, alta) :-
    sintoma(falha_ignicao),
    bateria_recarregada.

probabilidade(sensor_virabrequim_defeituoso, media) :-
    sintoma(falha_ignicao),
    not(bateria_recarregada).

probabilidade(alternador_defeituoso, alta) :-
    sintoma(luz_bateria),
    not(correia_acessorios_rompida).

probabilidade(correia_acessorios_rompida, alta) :-
    sintoma(luz_bateria),
    not(alternador_defeituoso).

% Condições adicionais
bateria_recarregada. % Exemplo: suponha que a bateria foi recarregada recentemente

% Regra principal para diagnóstico
diagnostico(Sintoma) :-
    sintoma(Sintoma),
    format('Diagnóstico para sintoma: ~w~n', [Sintoma]),
    format('Possíveis causas:~n'),
    forall(causa(Sintoma, Causa), format('- ~w~n', [Causa])),
    format('Probabilidades:~n'),
    forall((causa(Sintoma, Causa), probabilidade(Causa, Probabilidade)), 
           format('- ~w: ~w~n', [Causa, Probabilidade])).
