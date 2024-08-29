grammar Expresiones;

// La regla inicial
prog: stat+;

// Las reglas de declaración y expresión
stat: expr NEWLINE          # exprStat
    | ID '=' expr NEWLINE   # assignStat
    | NEWLINE               # emptyStat
    ;

// Regla para las expresiones, extendida para incluir negativos, raíces, potencias y manejo de errores
expr: expr op=(MUL | DIV) expr     # MulDivExpr
    | expr op=(ADD | SUB) expr     # AddSubExpr
    | expr '^' expr              # PowExpr
    | '-' expr                   # NegExpr
    | 'sqrt' '(' expr ')'        # SqrtExpr
    | INT                        # IntExpr
    | ID                         # IdExpr
    | '(' expr ')'               # ParenExpr
    ;

// Definición de tokens
ADD  : '+' ;                     // Suma
SUB  : '-' ;                     // Resta
MUL  : '*' ;                     // Multiplicación
DIV  : '/' ;                     // División
ID   : [a-zA-Z]+ ;               // Identificadores
INT  : [0-9]+ ;                  // Números enteros
NEWLINE : '\r'? '\n' ;          // Nueva línea
WS   : [ \t]+ -> skip ;           // Espacios en blanco

