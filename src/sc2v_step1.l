/* -----------------------------------------------------------------------------
 *
 *  SystemC to Verilog Translator v0.1
 *  Provided by OpenSoc Design
 *  
 *  www.opensocdesign.com
 *
 * -----------------------------------------------------------------------------
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 */


%{
#include <stdio.h>
#include "y.tab.h"

extern int yylval;

%}

%%
[0-9]+                              yylval=atoi(yytext); return NUMBER;
void                                /* Ignore void */
"::"                                return DOSPUNTOSDOBLE;
sc_int                              return SC_INT;
sc_uint                             return SC_UINT;
sc_bigint                           return SC_BIGINT;
sc_biguint                          return SC_BIGUINT;
bool                                return BOOL;
">"                                 return MAYOR;
"<"                                 return MENOR;
"{"                                 return OPENKEY;
"}"                                 return CLOSEKEY;
"("                                 return OPENPAR;
")"                                 return CLOSEPAR;
"["                                 return OPENCORCH;
"]"                                 return CLOSECORCH;
".write"                            return WRITE;
"switch"                            return SWITCH;
"case"                              return CASE;
"default"                           return DEFAULT;
"break"                             return BREAK;
".read"                             return READ;
".range"                            return RANGE;
"#define"                           return DEFINE;
"#include"                          /* Ignore #include */
[a-zA-Z][_a-zA-Z0-9]*               yylval=(int)strdup(yytext); return WORD;
[.:"^"!%()=/+*_"&""?""|""\\"]       yylval=(int)strdup(yytext); return SYMBOL;
"-"                                 yylval=(int)strdup(yytext); return SYMBOL;
"~"                                 yylval=(int)strdup(yytext); return SYMBOL;
"@"                                 yylval=(int)strdup(yytext); return SYMBOL;
"#"                                 yylval=(int)strdup(yytext); return SYMBOL;
","                                 return COLON;
";"                                 return SEMICOLON;
[" "]+                              /* Ignore white spaces*/
"\t"                                /* Ignore TAB; */
"\n"                                return NEWLINE;
"0x"                                return HEXA;
"$"                                 /* Ignore $ */
"(int)"                             /* Ignore int type conversions*/
%%