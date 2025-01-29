% Fatos sobre sintomas e problemas
sintoma(falha_ignicao, motor).
sintoma(superaquecimento, motor).
sintoma(bateria_fraca, eletrico).
sintoma(falha_alternador, eletrico).

% Regras para diagnosticar problemas
problema(falha_ignicao, motor) :-
    sintoma(falha_ignicao, motor),
    writeln('Diagnóstico: Falha de ignição no motor.'),
    writeln('Ação corretiva: Verificar velas de ignição e sistema de combustível.').

problema(superaquecimento, motor) :-
    sintoma(superaquecimento, motor),
    writeln('Diagnóstico: Motor superaquecido.'),
    writeln('Ação corretiva: Verificar nível de óleo e sistema de refrigeração.').

problema(bateria_fraca, eletrico) :-
    sintoma(bateria_fraca, eletrico),
    writeln('Diagnóstico: Bateria fraca.'),
    writeln('Ação corretiva: Carregar ou substituir a bateria.').

problema(falha_alternador, eletrico) :-
    sintoma(falha_alternador, eletrico),
    writeln('Diagnóstico: Falha no alternador.'),
    writeln('Ação corretiva: Verificar o alternador e substituir se necessário.').

% Regra principal para diagnóstico
diagnostico :-
    writeln('Iniciando diagnóstico...'),
    (problema(Problema, Tipo) ->
        writeln('Diagnóstico concluído.'),
        writeln('----------------------')
    ;
        writeln('Nenhum problema detectado.')
    ).