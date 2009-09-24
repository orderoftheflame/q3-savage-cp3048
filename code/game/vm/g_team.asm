export Team_InitGame
code
proc Team_InitGame 4 12
file "../g_team.c"
line 47
;1:/*
;2:===========================================================================
;3:Copyright (C) 1999-2005 Id Software, Inc.
;4:
;5:This file is part of Quake III Arena source code.
;6:
;7:Quake III Arena source code is free software; you can redistribute it
;8:and/or modify it under the terms of the GNU General Public License as
;9:published by the Free Software Foundation; either version 2 of the License,
;10:or (at your option) any later version.
;11:
;12:Quake III Arena source code is distributed in the hope that it will be
;13:useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;14:MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;15:GNU General Public License for more details.
;16:
;17:You should have received a copy of the GNU General Public License
;18:along with Foobar; if not, write to the Free Software
;19:Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
;20:
;21:Modified by Greg Dolley [1/1/2008]
;22:===========================================================================
;23:*/
;24://
;25:
;26:#include "g_local.h"
;27:
;28:
;29:typedef struct teamgame_s {
;30:	float			last_flag_capture;
;31:	int				last_capture_team;
;32:	flagStatus_t	redStatus;	// CTF
;33:	flagStatus_t	blueStatus;	// CTF
;34:	flagStatus_t	flagStatus;	// One Flag CTF
;35:	int				redTakenTime;
;36:	int				blueTakenTime;
;37:	int				redObeliskAttackedTime;
;38:	int				blueObeliskAttackedTime;
;39:} teamgame_t;
;40:
;41:teamgame_t teamgame;
;42:
;43:gentity_t	*neutralObelisk;
;44:
;45:void Team_SetFlagStatus( int team, flagStatus_t status );
;46:
;47:void Team_InitGame( void ) {
line 48
;48:	memset(&teamgame, 0, sizeof teamgame);
ADDRGP4 teamgame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 36
ARGI4
ADDRGP4 memset
CALLP4
pop
line 50
;49:
;50:	switch( g_gametype.integer ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
EQI4 $56
ADDRGP4 $54
JUMPV
LABELV $56
line 52
;51:	case GT_CTF:
;52:		teamgame.redStatus = teamgame.blueStatus = (flagStatus_t)-1; // Invalid to force update // ***GREGS_VC9_PORT_MOD*** -- added typecast(s)
ADDRLP4 0
CNSTI4 -1
ASGNI4
ADDRGP4 teamgame+12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 teamgame+8
ADDRLP4 0
INDIRI4
ASGNI4
line 53
;53:		Team_SetFlagStatus( TEAM_RED, FLAG_ATBASE );
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 54
;54:		Team_SetFlagStatus( TEAM_BLUE, FLAG_ATBASE );
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 55
;55:		break;
line 63
;56:#ifdef MISSIONPACK
;57:	case GT_1FCTF:
;58:		teamgame.flagStatus = -1; // Invalid to force update
;59:		Team_SetFlagStatus( TEAM_FREE, FLAG_ATBASE );
;60:		break;
;61:#endif
;62:	default:
;63:		break;
LABELV $54
line 65
;64:	}
;65:}
LABELV $52
endproc Team_InitGame 4 12
export OtherTeam
proc OtherTeam 0 0
line 67
;66:
;67:int OtherTeam(int team) {
line 68
;68:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $60
line 69
;69:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $59
JUMPV
LABELV $60
line 70
;70:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $62
line 71
;71:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $59
JUMPV
LABELV $62
line 72
;72:	return team;
ADDRFP4 0
INDIRI4
RETI4
LABELV $59
endproc OtherTeam 0 0
export TeamName
proc TeamName 0 0
line 75
;73:}
;74:
;75:const char *TeamName(int team)  {
line 76
;76:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $65
line 77
;77:		return "RED";
ADDRGP4 $67
RETP4
ADDRGP4 $64
JUMPV
LABELV $65
line 78
;78:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $68
line 79
;79:		return "BLUE";
ADDRGP4 $70
RETP4
ADDRGP4 $64
JUMPV
LABELV $68
line 80
;80:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $71
line 81
;81:		return "SPECTATOR";
ADDRGP4 $73
RETP4
ADDRGP4 $64
JUMPV
LABELV $71
line 82
;82:	return "FREE";
ADDRGP4 $74
RETP4
LABELV $64
endproc TeamName 0 0
export OtherTeamName
proc OtherTeamName 0 0
line 85
;83:}
;84:
;85:const char *OtherTeamName(int team) {
line 86
;86:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $76
line 87
;87:		return "BLUE";
ADDRGP4 $70
RETP4
ADDRGP4 $75
JUMPV
LABELV $76
line 88
;88:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $78
line 89
;89:		return "RED";
ADDRGP4 $67
RETP4
ADDRGP4 $75
JUMPV
LABELV $78
line 90
;90:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $80
line 91
;91:		return "SPECTATOR";
ADDRGP4 $73
RETP4
ADDRGP4 $75
JUMPV
LABELV $80
line 92
;92:	return "FREE";
ADDRGP4 $74
RETP4
LABELV $75
endproc OtherTeamName 0 0
export TeamColorString
proc TeamColorString 0 0
line 95
;93:}
;94:
;95:const char *TeamColorString(int team) {
line 96
;96:	if (team==TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $83
line 97
;97:		return S_COLOR_RED;
ADDRGP4 $85
RETP4
ADDRGP4 $82
JUMPV
LABELV $83
line 98
;98:	else if (team==TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $86
line 99
;99:		return S_COLOR_BLUE;
ADDRGP4 $88
RETP4
ADDRGP4 $82
JUMPV
LABELV $86
line 100
;100:	else if (team==TEAM_SPECTATOR)
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $89
line 101
;101:		return S_COLOR_YELLOW;
ADDRGP4 $91
RETP4
ADDRGP4 $82
JUMPV
LABELV $89
line 102
;102:	return S_COLOR_WHITE;
ADDRGP4 $92
RETP4
LABELV $82
endproc TeamColorString 0 0
export PrintMsg
proc PrintMsg 1048 12
line 106
;103:}
;104:
;105:// NULL for everyone
;106:void QDECL PrintMsg( gentity_t *ent, const char *fmt, ... ) {
line 111
;107:	char		msg[1024];
;108:	va_list		argptr;
;109:	char		*p;
;110:	
;111:	va_start (argptr,fmt);
ADDRLP4 1028
ADDRFP4 4+4
ASGNP4
line 112
;112:	if (vsprintf (msg, fmt, argptr) > sizeof(msg)) {
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 vsprintf
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CVIU4 4
CNSTU4 1024
LEU4 $95
line 113
;113:		G_Error ( "PrintMsg overrun" );
ADDRGP4 $97
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 114
;114:	}
LABELV $95
line 115
;115:	va_end (argptr);
ADDRLP4 1028
CNSTP4 0
ASGNP4
ADDRGP4 $99
JUMPV
LABELV $98
line 119
;116:
;117:	// double quotes are bad
;118:	while ((p = strchr(msg, '"')) != NULL)
;119:		*p = '\'';
ADDRLP4 0
INDIRP4
CNSTI1 39
ASGNI1
LABELV $99
line 118
ADDRLP4 4
ARGP4
CNSTI4 34
ARGI4
ADDRLP4 1036
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 1036
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $98
line 121
;120:
;121:	trap_SendServerCommand ( ( (ent == NULL) ? -1 : ent-g_entities ), va("print \"%s\"", msg ));
ADDRGP4 $102
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $103
ADDRLP4 1040
CNSTI4 -1
ASGNI4
ADDRGP4 $104
JUMPV
LABELV $103
ADDRLP4 1040
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 808
DIVI4
ASGNI4
LABELV $104
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 122
;122:}
LABELV $93
endproc PrintMsg 1048 12
export AddTeamScore
proc AddTeamScore 16 8
line 132
;123:
;124:/*
;125:==============
;126:AddTeamScore
;127:
;128: used for gametype > GT_TEAM
;129: for gametype GT_TEAM the level.teamScores is updated in AddScore in g_combat.c
;130:==============
;131:*/
;132:void AddTeamScore(vec3_t origin, int team, int score) {
line 135
;133:	gentity_t	*te;
;134:
;135:	te = G_TempEntity(origin, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 136
;136:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 138
;137:
;138:	if ( team == TEAM_RED ) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $106
line 139
;139:		if ( level.teamScores[ TEAM_RED ] + score == level.teamScores[ TEAM_BLUE ] ) {
ADDRGP4 level+44+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+8
INDIRI4
NEI4 $108
line 141
;140:			//teams are tied sound
;141:			te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 12
ASGNI4
line 142
;142:		}
ADDRGP4 $107
JUMPV
LABELV $108
line 143
;143:		else if ( level.teamScores[ TEAM_RED ] <= level.teamScores[ TEAM_BLUE ] &&
ADDRGP4 level+44+4
INDIRI4
ADDRGP4 level+44+8
INDIRI4
GTI4 $114
ADDRGP4 level+44+4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+8
INDIRI4
LEI4 $114
line 144
;144:					level.teamScores[ TEAM_RED ] + score > level.teamScores[ TEAM_BLUE ]) {
line 146
;145:			// red took the lead sound
;146:			te->s.eventParm = GTS_REDTEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 10
ASGNI4
line 147
;147:		}
ADDRGP4 $107
JUMPV
LABELV $114
line 148
;148:		else {
line 150
;149:			// red scored sound
;150:			te->s.eventParm = GTS_REDTEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 8
ASGNI4
line 151
;151:		}
line 152
;152:	}
ADDRGP4 $107
JUMPV
LABELV $106
line 153
;153:	else {
line 154
;154:		if ( level.teamScores[ TEAM_BLUE ] + score == level.teamScores[ TEAM_RED ] ) {
ADDRGP4 level+44+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+4
INDIRI4
NEI4 $124
line 156
;155:			//teams are tied sound
;156:			te->s.eventParm = GTS_TEAMS_ARE_TIED;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 12
ASGNI4
line 157
;157:		}
ADDRGP4 $125
JUMPV
LABELV $124
line 158
;158:		else if ( level.teamScores[ TEAM_BLUE ] <= level.teamScores[ TEAM_RED ] &&
ADDRGP4 level+44+8
INDIRI4
ADDRGP4 level+44+4
INDIRI4
GTI4 $130
ADDRGP4 level+44+8
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ADDRGP4 level+44+4
INDIRI4
LEI4 $130
line 159
;159:					level.teamScores[ TEAM_BLUE ] + score > level.teamScores[ TEAM_RED ]) {
line 161
;160:			// blue took the lead sound
;161:			te->s.eventParm = GTS_BLUETEAM_TOOK_LEAD;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 11
ASGNI4
line 162
;162:		}
ADDRGP4 $131
JUMPV
LABELV $130
line 163
;163:		else {
line 165
;164:			// blue scored sound
;165:			te->s.eventParm = GTS_BLUETEAM_SCORED;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 9
ASGNI4
line 166
;166:		}
LABELV $131
LABELV $125
line 167
;167:	}
LABELV $107
line 168
;168:	level.teamScores[ team ] += score;
ADDRLP4 12
ADDRFP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 169
;169:}
LABELV $105
endproc AddTeamScore 16 8
export OnSameTeam
proc OnSameTeam 16 0
line 176
;170:
;171:/*
;172:==============
;173:OnSameTeam
;174:==============
;175:*/
;176:qboolean OnSameTeam( gentity_t *ent1, gentity_t *ent2 ) {
line 177
;177:	if ( !ent1->client || !ent2->client ) {
ADDRLP4 0
CNSTI4 516
ASGNI4
ADDRLP4 4
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
EQU4 $144
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRU4
NEU4 $142
LABELV $144
line 178
;178:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $142
line 181
;179:	}
;180:
;181:	if ( g_gametype.integer < GT_TEAM ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $145
line 182
;182:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $141
JUMPV
LABELV $145
line 185
;183:	}
;184:
;185:	if ( ent1->client->sess.sessionTeam == ent2->client->sess.sessionTeam ) {
ADDRLP4 8
CNSTI4 516
ASGNI4
ADDRLP4 12
CNSTI4 616
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 8
INDIRI4
ADDP4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRI4
NEI4 $148
line 186
;186:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $141
JUMPV
LABELV $148
line 189
;187:	}
;188:
;189:	return qfalse;
CNSTI4 0
RETI4
LABELV $141
endproc OnSameTeam 16 0
data
align 1
LABELV ctfFlagStatusRemap
byte 1 48
byte 1 49
byte 1 42
byte 1 42
byte 1 50
align 1
LABELV oneFlagStatusRemap
byte 1 48
byte 1 49
byte 1 50
byte 1 51
byte 1 52
export Team_SetFlagStatus
code
proc Team_SetFlagStatus 12 8
line 196
;190:}
;191:
;192:
;193:static char ctfFlagStatusRemap[] = { '0', '1', '*', '*', '2' };
;194:static char oneFlagStatusRemap[] = { '0', '1', '2', '3', '4' };
;195:
;196:void Team_SetFlagStatus( int team, flagStatus_t status ) {
line 197
;197:	qboolean modified = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 199
;198:
;199:	switch( team ) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $163
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $153
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $158
ADDRGP4 $151
JUMPV
LABELV $153
line 201
;200:	case TEAM_RED:	// CTF
;201:		if( teamgame.redStatus != status ) {
ADDRGP4 teamgame+8
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $152
line 202
;202:			teamgame.redStatus = status;
ADDRGP4 teamgame+8
ADDRFP4 4
INDIRI4
ASGNI4
line 203
;203:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 204
;204:		}
line 205
;205:		break;
ADDRGP4 $152
JUMPV
LABELV $158
line 208
;206:
;207:	case TEAM_BLUE:	// CTF
;208:		if( teamgame.blueStatus != status ) {
ADDRGP4 teamgame+12
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $152
line 209
;209:			teamgame.blueStatus = status;
ADDRGP4 teamgame+12
ADDRFP4 4
INDIRI4
ASGNI4
line 210
;210:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 211
;211:		}
line 212
;212:		break;
ADDRGP4 $152
JUMPV
LABELV $163
line 215
;213:
;214:	case TEAM_FREE:	// One Flag CTF
;215:		if( teamgame.flagStatus != status ) {
ADDRGP4 teamgame+16
INDIRI4
ADDRFP4 4
INDIRI4
EQI4 $152
line 216
;216:			teamgame.flagStatus = status;
ADDRGP4 teamgame+16
ADDRFP4 4
INDIRI4
ASGNI4
line 217
;217:			modified = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 218
;218:		}
line 219
;219:		break;
LABELV $151
LABELV $152
line 222
;220:	}
;221:
;222:	if( modified ) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $168
line 225
;223:		char st[4];
;224:
;225:		if( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $170
line 226
;226:			st[0] = ctfFlagStatusRemap[teamgame.redStatus];
ADDRLP4 8
ADDRGP4 teamgame+8
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 227
;227:			st[1] = ctfFlagStatusRemap[teamgame.blueStatus];
ADDRLP4 8+1
ADDRGP4 teamgame+12
INDIRI4
ADDRGP4 ctfFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 228
;228:			st[2] = 0;
ADDRLP4 8+2
CNSTI1 0
ASGNI1
line 229
;229:		}
ADDRGP4 $171
JUMPV
LABELV $170
line 230
;230:		else {		// GT_1FCTF
line 231
;231:			st[0] = oneFlagStatusRemap[teamgame.flagStatus];
ADDRLP4 8
ADDRGP4 teamgame+16
INDIRI4
ADDRGP4 oneFlagStatusRemap
ADDP4
INDIRI1
ASGNI1
line 232
;232:			st[1] = 0;
ADDRLP4 8+1
CNSTI1 0
ASGNI1
line 233
;233:		}
LABELV $171
line 235
;234:
;235:		trap_SetConfigstring( CS_FLAGSTATUS, st );
CNSTI4 23
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 236
;236:	}
LABELV $168
line 237
;237:}
LABELV $150
endproc Team_SetFlagStatus 12 8
export Team_CheckDroppedItem
proc Team_CheckDroppedItem 0 8
line 239
;238:
;239:void Team_CheckDroppedItem( gentity_t *dropped ) {
line 240
;240:	if( dropped->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $180
line 241
;241:		Team_SetFlagStatus( TEAM_RED, FLAG_DROPPED );
CNSTI4 1
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 242
;242:	}
ADDRGP4 $181
JUMPV
LABELV $180
line 243
;243:	else if( dropped->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $182
line 244
;244:		Team_SetFlagStatus( TEAM_BLUE, FLAG_DROPPED );
CNSTI4 2
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 245
;245:	}
ADDRGP4 $183
JUMPV
LABELV $182
line 246
;246:	else if( dropped->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 9
NEI4 $184
line 247
;247:		Team_SetFlagStatus( TEAM_FREE, FLAG_DROPPED );
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 248
;248:	}
LABELV $184
LABELV $183
LABELV $181
line 249
;249:}
LABELV $179
endproc Team_CheckDroppedItem 0 8
export Team_ForceGesture
proc Team_ForceGesture 12 0
line 256
;250:
;251:/*
;252:================
;253:Team_ForceGesture
;254:================
;255:*/
;256:void Team_ForceGesture(int team) {
line 260
;257:	int i;
;258:	gentity_t *ent;
;259:
;260:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $187
line 261
;261:		ent = &g_entities[i];
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 262
;262:		if (!ent->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $191
line 263
;263:			continue;
ADDRGP4 $188
JUMPV
LABELV $191
line 264
;264:		if (!ent->client)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $193
line 265
;265:			continue;
ADDRGP4 $188
JUMPV
LABELV $193
line 266
;266:		if (ent->client->sess.sessionTeam != team)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $195
line 267
;267:			continue;
ADDRGP4 $188
JUMPV
LABELV $195
line 269
;268:		//
;269:		ent->flags |= FL_FORCE_GESTURE;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 270
;270:	}
LABELV $188
line 260
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $187
line 271
;271:}
LABELV $186
endproc Team_ForceGesture 12 0
export Team_FragBonuses
proc Team_FragBonuses 276 16
line 283
;272:
;273:/*
;274:================
;275:Team_FragBonuses
;276:
;277:Calculate the bonuses for flag defense, flag carrier defense, etc.
;278:Note that bonuses are not cumulative.  You get one, they are in importance
;279:order.
;280:================
;281:*/
;282:void Team_FragBonuses(gentity_t *targ, gentity_t *inflictor, gentity_t *attacker)
;283:{
line 289
;284:	int i;
;285:	gentity_t *ent;
;286:	int flag_pw, enemy_flag_pw;
;287:	int otherteam;
;288:	int tokens;
;289:	gentity_t *flag, *carrier = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 295
;290:	char *c;
;291:	vec3_t v1, v2;
;292:	int team;
;293:
;294:	// no bonus for fragging yourself or team mates
;295:	if (!targ->client || !attacker->client || targ == attacker || OnSameTeam(targ, attacker))
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
CNSTI4 516
ASGNI4
ADDRLP4 72
CNSTU4 0
ASGNU4
ADDRLP4 64
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $202
ADDRLP4 76
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 68
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRU4
EQU4 $202
ADDRLP4 64
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRP4
CVPU4 4
EQU4 $202
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $198
LABELV $202
line 296
;296:		return;
ADDRGP4 $197
JUMPV
LABELV $198
line 298
;297:
;298:	team = targ->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
line 299
;299:	otherteam = OtherTeam(targ->client->sess.sessionTeam);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRLP4 84
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 84
INDIRI4
ASGNI4
line 300
;300:	if (otherteam < 0)
ADDRLP4 20
INDIRI4
CNSTI4 0
GEI4 $203
line 301
;301:		return; // whoever died isn't on a team
ADDRGP4 $197
JUMPV
LABELV $203
line 304
;302:
;303:	// same team, if the flag at base, check to he has the enemy flag
;304:	if (team == TEAM_RED) {
ADDRLP4 52
INDIRI4
CNSTI4 1
NEI4 $205
line 305
;305:		flag_pw = PW_REDFLAG;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 306
;306:		enemy_flag_pw = PW_BLUEFLAG;
ADDRLP4 60
CNSTI4 8
ASGNI4
line 307
;307:	} else {
ADDRGP4 $206
JUMPV
LABELV $205
line 308
;308:		flag_pw = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 8
ASGNI4
line 309
;309:		enemy_flag_pw = PW_REDFLAG;
ADDRLP4 60
CNSTI4 7
ASGNI4
line 310
;310:	}
LABELV $206
line 312
;311:
;312:	if (g_gametype.integer == GT_1FCTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
NEI4 $207
line 313
;313:		enemy_flag_pw = PW_NEUTRALFLAG;
ADDRLP4 60
CNSTI4 9
ASGNI4
line 314
;314:	} 
LABELV $207
line 317
;315:
;316:	// did the attacker frag the flag carrier?
;317:	tokens = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 323
;318:#ifdef MISSIONPACK
;319:	if( g_gametype.integer == GT_HARVESTER ) {
;320:		tokens = targ->client->ps.generic1;
;321:	}
;322:#endif
;323:	if (targ->client->ps.powerups[enemy_flag_pw]) {
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $210
line 324
;324:		attacker->client->pers.teamState.lastfraggedcarrier = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 325
;325:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 326
;326:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 88
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 580
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 327
;327:		PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's flag carrier!\n",
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 92
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $213
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 332
;328:			attacker->client->pers.netname, TeamName(team));
;329:
;330:		// the target had the flag, clear the hurt carrier
;331:		// field on the other team
;332:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $214
line 333
;333:			ent = g_entities + i;
ADDRLP4 12
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 334
;334:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 12
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $219
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $219
line 335
;335:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
LABELV $219
line 336
;336:		}
LABELV $215
line 332
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $217
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $214
line 337
;337:		return;
ADDRGP4 $197
JUMPV
LABELV $210
line 341
;338:	}
;339:
;340:	// did the attacker frag a head carrier? other->client->ps.generic1
;341:	if (tokens) {
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $221
line 342
;342:		attacker->client->pers.teamState.lastfraggedcarrier = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 343
;343:		AddScore(attacker, targ->r.currentOrigin, CTF_FRAG_CARRIER_BONUS * tokens * tokens);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 56
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 56
INDIRI4
MULI4
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 344
;344:		attacker->client->pers.teamState.fragcarrier++;
ADDRLP4 92
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 580
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 345
;345:		PrintMsg(NULL, "%s" S_COLOR_WHITE " fragged %s's skull carrier!\n",
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $224
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 350
;346:			attacker->client->pers.netname, TeamName(team));
;347:
;348:		// the target had the flag, clear the hurt carrier
;349:		// field on the other team
;350:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $228
JUMPV
LABELV $225
line 351
;351:			ent = g_entities + i;
ADDRLP4 12
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 352
;352:			if (ent->inuse && ent->client->sess.sessionTeam == otherteam)
ADDRLP4 12
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $230
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $230
line 353
;353:				ent->client->pers.teamState.lasthurtcarrier = 0;
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
LABELV $230
line 354
;354:		}
LABELV $226
line 350
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $228
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $225
line 355
;355:		return;
ADDRGP4 $197
JUMPV
LABELV $221
line 358
;356:	}
;357:
;358:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 88
CNSTI4 516
ASGNI4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
ASGNF4
ADDRLP4 92
INDIRF4
CNSTF4 0
EQF4 $232
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $232
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDRLP4 88
INDIRI4
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $232
line 360
;359:		level.time - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT &&
;360:		!attacker->client->ps.powerups[flag_pw]) {
line 363
;361:		// attacker is on the same team as the flag carrier and
;362:		// fragged a guy who hurt our flag carrier
;363:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 365
;364:
;365:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 96
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 366
;366:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 368
;367:
;368:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 369
;369:		team = attacker->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
line 371
;370:		// add the sprite over the player's head
;371:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 372
;372:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 373
;373:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 375
;374:
;375:		return;
ADDRGP4 $197
JUMPV
LABELV $232
line 378
;376:	}
;377:
;378:	if (targ->client->pers.teamState.lasthurtcarrier &&
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
INDIRF4
ASGNF4
ADDRLP4 96
INDIRF4
CNSTF4 0
EQF4 $236
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 96
INDIRF4
SUBF4
CNSTF4 1174011904
GEF4 $236
line 379
;379:		level.time - targ->client->pers.teamState.lasthurtcarrier < CTF_CARRIER_DANGER_PROTECT_TIMEOUT) {
line 381
;380:		// attacker is on the same team as the skull carrier and
;381:		AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_DANGER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 383
;382:
;383:		attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 384
;384:		targ->client->pers.teamState.lasthurtcarrier = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 0
ASGNF4
line 386
;385:
;386:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 104
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 387
;387:		team = attacker->client->sess.sessionTeam;
ADDRLP4 52
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
line 389
;388:		// add the sprite over the player's head
;389:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 108
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 390
;390:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 112
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 391
;391:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 393
;392:
;393:		return;
ADDRGP4 $197
JUMPV
LABELV $236
line 420
;394:	}
;395:
;396:	// flag and flag carrier area defense bonuses
;397:
;398:	// we have to find the flag and carrier entities
;399:
;400:#ifdef MISSIONPACK	
;401:	if( g_gametype.integer == GT_OBELISK ) {
;402:		// find the team obelisk
;403:		switch (attacker->client->sess.sessionTeam) {
;404:		case TEAM_RED:
;405:			c = "team_redobelisk";
;406:			break;
;407:		case TEAM_BLUE:
;408:			c = "team_blueobelisk";
;409:			break;		
;410:		default:
;411:			return;
;412:		}
;413:		
;414:	} else if (g_gametype.integer == GT_HARVESTER ) {
;415:		// find the center obelisk
;416:		c = "team_neutralobelisk";
;417:	} else {
;418:#endif
;419:	// find the flag
;420:	switch (attacker->client->sess.sessionTeam) {
ADDRLP4 100
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 1
EQI4 $243
ADDRLP4 100
INDIRI4
CNSTI4 2
EQI4 $245
ADDRGP4 $197
JUMPV
LABELV $243
line 422
;421:	case TEAM_RED:
;422:		c = "team_CTF_redflag";
ADDRLP4 24
ADDRGP4 $244
ASGNP4
line 423
;423:		break;
ADDRGP4 $241
JUMPV
LABELV $245
line 425
;424:	case TEAM_BLUE:
;425:		c = "team_CTF_blueflag";
ADDRLP4 24
ADDRGP4 $246
ASGNP4
line 426
;426:		break;		
line 428
;427:	default:
;428:		return;
LABELV $241
line 431
;429:	}
;430:	// find attacker's team's flag carrier
;431:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $250
JUMPV
LABELV $247
line 432
;432:		carrier = g_entities + i;
ADDRLP4 4
CNSTI4 808
ADDRLP4 0
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 433
;433:		if (carrier->inuse && carrier->client->ps.powerups[flag_pw])
ADDRLP4 112
CNSTI4 0
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $252
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRLP4 112
INDIRI4
EQI4 $252
line 434
;434:			break;
ADDRGP4 $249
JUMPV
LABELV $252
line 435
;435:		carrier = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 436
;436:	}
LABELV $248
line 431
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $250
ADDRLP4 0
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $247
LABELV $249
line 440
;437:#ifdef MISSIONPACK
;438:	}
;439:#endif
;440:	flag = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
ADDRGP4 $255
JUMPV
LABELV $254
line 441
;441:	while ((flag = G_Find (flag, FOFS(classname), c)) != NULL) {
line 442
;442:		if (!(flag->flags & FL_DROPPED_ITEM))
ADDRLP4 8
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $257
line 443
;443:			break;
ADDRGP4 $256
JUMPV
LABELV $257
line 444
;444:	}
LABELV $255
line 441
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 108
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $254
LABELV $256
line 446
;445:
;446:	if (!flag)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $259
line 447
;447:		return; // can't find attacker's flag
ADDRGP4 $197
JUMPV
LABELV $259
line 452
;448:
;449:	// ok we have the attackers flag and a pointer to the carrier
;450:
;451:	// check to see if we are defending the base's flag
;452:	VectorSubtract(targ->r.currentOrigin, flag->r.currentOrigin, v1);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
CNSTI4 488
ASGNI4
ADDRLP4 28
ADDRLP4 112
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 116
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 124
CNSTI4 492
ASGNI4
ADDRLP4 28+4
ADDRLP4 112
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 124
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 128
CNSTI4 496
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 128
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 453
;453:	VectorSubtract(attacker->r.currentOrigin, flag->r.currentOrigin, v2);
ADDRLP4 132
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 136
CNSTI4 488
ASGNI4
ADDRLP4 40
ADDRLP4 132
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 136
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144
CNSTI4 492
ASGNI4
ADDRLP4 40+4
ADDRLP4 132
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 144
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 148
CNSTI4 496
ASGNI4
ADDRLP4 40+8
ADDRFP4 8
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
ADDRLP4 148
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 455
;454:
;455:	if ( ( ( VectorLength(v1) < CTF_TARGET_PROTECT_RADIUS &&
ADDRLP4 28
ARGP4
ADDRLP4 152
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 1148846080
GEF4 $268
ADDRLP4 156
CNSTI4 488
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 156
INDIRI4
ADDP4
ARGP4
ADDRLP4 160
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $267
LABELV $268
ADDRLP4 40
ARGP4
ADDRLP4 164
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 164
INDIRF4
CNSTF4 1148846080
GEF4 $265
ADDRLP4 168
CNSTI4 488
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 168
INDIRI4
ADDP4
ARGP4
ADDRLP4 172
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $265
LABELV $267
ADDRLP4 176
CNSTI4 516
ASGNI4
ADDRLP4 180
CNSTI4 616
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 176
INDIRI4
ADDP4
INDIRP4
ADDRLP4 180
INDIRI4
ADDP4
INDIRI4
EQI4 $265
line 459
;456:		trap_InPVS(flag->r.currentOrigin, targ->r.currentOrigin ) ) ||
;457:		( VectorLength(v2) < CTF_TARGET_PROTECT_RADIUS &&
;458:		trap_InPVS(flag->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;459:		attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 462
;460:
;461:		// we defended the base flag
;462:		AddScore(attacker, targ->r.currentOrigin, CTF_FLAG_DEFENSE_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 463
;463:		attacker->client->pers.teamState.basedefense++;
ADDRLP4 184
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 568
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 465
;464:
;465:		attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 467
;466:		// add the sprite over the player's head
;467:		attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 192
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 468
;468:		attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 196
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 469
;469:		attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 471
;470:
;471:		return;
ADDRGP4 $197
JUMPV
LABELV $265
line 474
;472:	}
;473:
;474:	if (carrier && carrier != attacker) {
ADDRLP4 184
ADDRLP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 184
INDIRU4
CNSTU4 0
EQU4 $270
ADDRLP4 184
INDIRU4
ADDRFP4 8
INDIRP4
CVPU4 4
EQU4 $270
line 475
;475:		VectorSubtract(targ->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
CNSTI4 488
ASGNI4
ADDRLP4 28
ADDRLP4 188
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 192
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 200
CNSTI4 492
ASGNI4
ADDRLP4 28+4
ADDRLP4 188
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 200
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 204
CNSTI4 496
ASGNI4
ADDRLP4 28+8
ADDRFP4 0
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 204
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 476
;476:		VectorSubtract(attacker->r.currentOrigin, carrier->r.currentOrigin, v1);
ADDRLP4 208
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 212
CNSTI4 488
ASGNI4
ADDRLP4 28
ADDRLP4 208
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 212
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 220
CNSTI4 492
ASGNI4
ADDRLP4 28+4
ADDRLP4 208
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 220
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 224
CNSTI4 496
ASGNI4
ADDRLP4 28+8
ADDRFP4 8
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
ADDRLP4 224
INDIRI4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 478
;477:
;478:		if ( ( ( VectorLength(v1) < CTF_ATTACKER_PROTECT_RADIUS &&
ADDRLP4 28
ARGP4
ADDRLP4 228
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 228
INDIRF4
CNSTF4 1148846080
GEF4 $279
ADDRLP4 232
CNSTI4 488
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ADDRLP4 232
INDIRI4
ADDP4
ARGP4
ADDRLP4 236
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 236
INDIRI4
CNSTI4 0
NEI4 $278
LABELV $279
ADDRLP4 40
ARGP4
ADDRLP4 240
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 240
INDIRF4
CNSTF4 1148846080
GEF4 $276
ADDRLP4 244
CNSTI4 488
ASGNI4
ADDRLP4 4
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ADDRLP4 244
INDIRI4
ADDP4
ARGP4
ADDRLP4 248
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
EQI4 $276
LABELV $278
ADDRLP4 252
CNSTI4 516
ASGNI4
ADDRLP4 256
CNSTI4 616
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 252
INDIRI4
ADDP4
INDIRP4
ADDRLP4 256
INDIRI4
ADDP4
INDIRI4
EQI4 $276
line 482
;479:			trap_InPVS(carrier->r.currentOrigin, targ->r.currentOrigin ) ) ||
;480:			( VectorLength(v2) < CTF_ATTACKER_PROTECT_RADIUS &&
;481:				trap_InPVS(carrier->r.currentOrigin, attacker->r.currentOrigin ) ) ) &&
;482:			attacker->client->sess.sessionTeam != targ->client->sess.sessionTeam) {
line 483
;483:			AddScore(attacker, targ->r.currentOrigin, CTF_CARRIER_PROTECT_BONUS);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 484
;484:			attacker->client->pers.teamState.carrierdefense++;
ADDRLP4 260
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 572
ADDP4
ASGNP4
ADDRLP4 260
INDIRP4
ADDRLP4 260
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 486
;485:
;486:			attacker->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 264
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 488
;487:			// add the sprite over the player's head
;488:			attacker->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 268
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 489
;489:			attacker->client->ps.eFlags |= EF_AWARD_DEFEND;
ADDRLP4 272
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
ADDRLP4 272
INDIRP4
INDIRI4
CNSTI4 65536
BORI4
ASGNI4
line 490
;490:			attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 492
;491:
;492:			return;
LABELV $276
line 494
;493:		}
;494:	}
LABELV $270
line 495
;495:}
LABELV $197
endproc Team_FragBonuses 276 16
export Team_CheckHurtCarrier
proc Team_CheckHurtCarrier 36 0
line 506
;496:
;497:/*
;498:================
;499:Team_CheckHurtCarrier
;500:
;501:Check to see if attacker hurt the flag carrier.  Needed when handing out bonuses for assistance to flag
;502:carrier defense.
;503:================
;504:*/
;505:void Team_CheckHurtCarrier(gentity_t *targ, gentity_t *attacker)
;506:{
line 509
;507:	int flag_pw;
;508:
;509:	if (!targ->client || !attacker->client)
ADDRLP4 4
CNSTI4 516
ASGNI4
ADDRLP4 8
CNSTU4 0
ASGNU4
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
EQU4 $284
ADDRFP4 4
INDIRP4
ADDRLP4 4
INDIRI4
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRU4
NEU4 $282
LABELV $284
line 510
;510:		return;
ADDRGP4 $281
JUMPV
LABELV $282
line 512
;511:
;512:	if (targ->client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 1
NEI4 $285
line 513
;513:		flag_pw = PW_BLUEFLAG;
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRGP4 $286
JUMPV
LABELV $285
line 515
;514:	else
;515:		flag_pw = PW_REDFLAG;
ADDRLP4 0
CNSTI4 7
ASGNI4
LABELV $286
line 518
;516:
;517:	// flags
;518:	if (targ->client->ps.powerups[flag_pw] &&
ADDRLP4 12
CNSTI4 516
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $287
ADDRLP4 20
CNSTI4 616
ASGNI4
ADDRLP4 16
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ADDP4
INDIRP4
ADDRLP4 20
INDIRI4
ADDP4
INDIRI4
EQI4 $287
line 520
;519:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;520:		attacker->client->pers.teamState.lasthurtcarrier = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
LABELV $287
line 523
;521:
;522:	// skulls
;523:	if (targ->client->ps.generic1 &&
ADDRLP4 24
CNSTI4 516
ASGNI4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $290
ADDRLP4 32
CNSTI4 616
ASGNI4
ADDRLP4 28
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ADDP4
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRI4
EQI4 $290
line 525
;524:		targ->client->sess.sessionTeam != attacker->client->sess.sessionTeam)
;525:		attacker->client->pers.teamState.lasthurtcarrier = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
LABELV $290
line 526
;526:}
LABELV $281
endproc Team_CheckHurtCarrier 36 0
export Team_ResetFlag
proc Team_ResetFlag 20 12
line 529
;527:
;528:
;529:gentity_t *Team_ResetFlag( int team ) {
line 531
;530:	char *c;
;531:	gentity_t *ent, *rent = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 533
;532:
;533:	switch (team) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $298
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $296
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $297
ADDRGP4 $294
JUMPV
LABELV $296
line 535
;534:	case TEAM_RED:
;535:		c = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $244
ASGNP4
line 536
;536:		break;
ADDRGP4 $295
JUMPV
LABELV $297
line 538
;537:	case TEAM_BLUE:
;538:		c = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $246
ASGNP4
line 539
;539:		break;
ADDRGP4 $295
JUMPV
LABELV $298
line 541
;540:	case TEAM_FREE:
;541:		c = "team_CTF_neutralflag";
ADDRLP4 4
ADDRGP4 $299
ASGNP4
line 542
;542:		break;
ADDRGP4 $295
JUMPV
LABELV $294
line 544
;543:	default:
;544:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $293
JUMPV
LABELV $295
line 547
;545:	}
;546:
;547:	ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $301
JUMPV
LABELV $300
line 548
;548:	while ((ent = G_Find (ent, FOFS(classname), c)) != NULL) {
line 549
;549:		if (ent->flags & FL_DROPPED_ITEM)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $303
line 550
;550:			G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
ADDRGP4 $304
JUMPV
LABELV $303
line 551
;551:		else {
line 552
;552:			rent = ent;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 553
;553:			RespawnItem(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 554
;554:		}
LABELV $304
line 555
;555:	}
LABELV $301
line 548
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $300
line 557
;556:
;557:	Team_SetFlagStatus( team, FLAG_ATBASE );
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 559
;558:
;559:	return rent;
ADDRLP4 8
INDIRP4
RETP4
LABELV $293
endproc Team_ResetFlag 20 12
export Team_ResetFlags
proc Team_ResetFlags 0 4
line 562
;560:}
;561:
;562:void Team_ResetFlags( void ) {
line 563
;563:	if( g_gametype.integer == GT_CTF ) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $306
line 564
;564:		Team_ResetFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 565
;565:		Team_ResetFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ResetFlag
CALLP4
pop
line 566
;566:	}
LABELV $306
line 572
;567:#ifdef MISSIONPACK
;568:	else if( g_gametype.integer == GT_1FCTF ) {
;569:		Team_ResetFlag( TEAM_FREE );
;570:	}
;571:#endif
;572:}
LABELV $305
endproc Team_ResetFlags 0 4
export Team_ReturnFlagSound
proc Team_ReturnFlagSound 12 8
line 574
;573:
;574:void Team_ReturnFlagSound( gentity_t *ent, int team ) {
line 577
;575:	gentity_t	*te;
;576:
;577:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $310
line 578
;578:		G_Printf ("Warning:  NULL passed to Team_ReturnFlagSound\n");
ADDRGP4 $312
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 579
;579:		return;
ADDRGP4 $309
JUMPV
LABELV $310
line 582
;580:	}
;581:
;582:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 583
;583:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $313
line 584
;584:		te->s.eventParm = GTS_RED_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 2
ASGNI4
line 585
;585:	}
ADDRGP4 $314
JUMPV
LABELV $313
line 586
;586:	else {
line 587
;587:		te->s.eventParm = GTS_BLUE_RETURN;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 3
ASGNI4
line 588
;588:	}
LABELV $314
line 589
;589:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 590
;590:}
LABELV $309
endproc Team_ReturnFlagSound 12 8
export Team_TakeFlagSound
proc Team_TakeFlagSound 16 8
line 592
;591:
;592:void Team_TakeFlagSound( gentity_t *ent, int team ) {
line 595
;593:	gentity_t	*te;
;594:
;595:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $316
line 596
;596:		G_Printf ("Warning:  NULL passed to Team_TakeFlagSound\n");
ADDRGP4 $318
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 597
;597:		return;
ADDRGP4 $315
JUMPV
LABELV $316
line 602
;598:	}
;599:
;600:	// only play sound when the flag was at the base
;601:	// or not picked up the last 10 seconds
;602:	switch(team) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $321
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $331
ADDRGP4 $319
JUMPV
LABELV $321
line 604
;603:		case TEAM_RED:
;604:			if( teamgame.blueStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+12
INDIRI4
CNSTI4 0
EQI4 $322
line 605
;605:				if (teamgame.blueTakenTime > level.time - 10000)
ADDRGP4 teamgame+24
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $325
line 606
;606:					return;
ADDRGP4 $315
JUMPV
LABELV $325
line 607
;607:			}
LABELV $322
line 608
;608:			teamgame.blueTakenTime = level.time;
ADDRGP4 teamgame+24
ADDRGP4 level+32
INDIRI4
ASGNI4
line 609
;609:			break;
ADDRGP4 $320
JUMPV
LABELV $331
line 612
;610:
;611:		case TEAM_BLUE:	// CTF
;612:			if( teamgame.redStatus != FLAG_ATBASE ) {
ADDRGP4 teamgame+8
INDIRI4
CNSTI4 0
EQI4 $332
line 613
;613:				if (teamgame.redTakenTime > level.time - 10000)
ADDRGP4 teamgame+20
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $335
line 614
;614:					return;
ADDRGP4 $315
JUMPV
LABELV $335
line 615
;615:			}
LABELV $332
line 616
;616:			teamgame.redTakenTime = level.time;
ADDRGP4 teamgame+20
ADDRGP4 level+32
INDIRI4
ASGNI4
line 617
;617:			break;
LABELV $319
LABELV $320
line 620
;618:	}
;619:
;620:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 8
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 621
;621:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $341
line 622
;622:		te->s.eventParm = GTS_RED_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 4
ASGNI4
line 623
;623:	}
ADDRGP4 $342
JUMPV
LABELV $341
line 624
;624:	else {
line 625
;625:		te->s.eventParm = GTS_BLUE_TAKEN;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 5
ASGNI4
line 626
;626:	}
LABELV $342
line 627
;627:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 628
;628:}
LABELV $315
endproc Team_TakeFlagSound 16 8
export Team_CaptureFlagSound
proc Team_CaptureFlagSound 12 8
line 630
;629:
;630:void Team_CaptureFlagSound( gentity_t *ent, int team ) {
line 633
;631:	gentity_t	*te;
;632:
;633:	if (ent == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $344
line 634
;634:		G_Printf ("Warning:  NULL passed to Team_CaptureFlagSound\n");
ADDRGP4 $346
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 635
;635:		return;
ADDRGP4 $343
JUMPV
LABELV $344
line 638
;636:	}
;637:
;638:	te = G_TempEntity( ent->s.pos.trBase, EV_GLOBAL_TEAM_SOUND );
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 639
;639:	if( team == TEAM_BLUE ) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $347
line 640
;640:		te->s.eventParm = GTS_BLUE_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 1
ASGNI4
line 641
;641:	}
ADDRGP4 $348
JUMPV
LABELV $347
line 642
;642:	else {
line 643
;643:		te->s.eventParm = GTS_RED_CAPTURE;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 0
ASGNI4
line 644
;644:	}
LABELV $348
line 645
;645:	te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 646
;646:}
LABELV $343
endproc Team_CaptureFlagSound 12 8
export Team_ReturnFlag
proc Team_ReturnFlag 8 12
line 648
;647:
;648:void Team_ReturnFlag( int team ) {
line 649
;649:	Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 650
;650:	if( team == TEAM_FREE ) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $350
line 651
;651:		PrintMsg(NULL, "The flag has returned!\n" );
CNSTP4 0
ARGP4
ADDRGP4 $352
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 652
;652:	}
ADDRGP4 $351
JUMPV
LABELV $350
line 653
;653:	else {
line 654
;654:		PrintMsg(NULL, "The %s flag has returned!\n", TeamName(team));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $353
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 655
;655:	}
LABELV $351
line 656
;656:}
LABELV $349
endproc Team_ReturnFlag 8 12
export Team_FreeEntity
proc Team_FreeEntity 0 4
line 658
;657:
;658:void Team_FreeEntity( gentity_t *ent ) {
line 659
;659:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $355
line 660
;660:		Team_ReturnFlag( TEAM_RED );
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 661
;661:	}
ADDRGP4 $356
JUMPV
LABELV $355
line 662
;662:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $357
line 663
;663:		Team_ReturnFlag( TEAM_BLUE );
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 664
;664:	}
ADDRGP4 $358
JUMPV
LABELV $357
line 665
;665:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 9
NEI4 $359
line 666
;666:		Team_ReturnFlag( TEAM_FREE );
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 667
;667:	}
LABELV $359
LABELV $358
LABELV $356
line 668
;668:}
LABELV $354
endproc Team_FreeEntity 0 4
export Team_DroppedFlagThink
proc Team_DroppedFlagThink 8 8
line 679
;669:
;670:/*
;671:==============
;672:Team_DroppedFlagThink
;673:
;674:Automatically set in Launch_Item if the item is one of the flags
;675:
;676:Flags are unique in that if they are dropped, the base flag must be respawned when they time out
;677:==============
;678:*/
;679:void Team_DroppedFlagThink(gentity_t *ent) {
line 680
;680:	int		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 682
;681:
;682:	if( ent->item->giTag == PW_REDFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $362
line 683
;683:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 684
;684:	}
ADDRGP4 $363
JUMPV
LABELV $362
line 685
;685:	else if( ent->item->giTag == PW_BLUEFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $364
line 686
;686:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 687
;687:	}
ADDRGP4 $365
JUMPV
LABELV $364
line 688
;688:	else if( ent->item->giTag == PW_NEUTRALFLAG ) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 9
NEI4 $366
line 689
;689:		team = TEAM_FREE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 690
;690:	}
LABELV $366
LABELV $365
LABELV $363
line 692
;691:
;692:	Team_ReturnFlagSound( Team_ResetFlag( team ), team );
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 694
;693:	// Reset Flag will delete this entity
;694:}
LABELV $361
endproc Team_DroppedFlagThink 8 8
export Team_TouchOurFlag
proc Team_TouchOurFlag 64 16
line 702
;695:
;696:
;697:/*
;698:==============
;699:Team_DroppedFlagThink
;700:==============
;701:*/
;702:int Team_TouchOurFlag( gentity_t *ent, gentity_t *other, int team ) {
line 705
;703:	int			i;
;704:	gentity_t	*player;
;705:	gclient_t	*cl = other->client;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 714
;706:	int			enemy_flag;
;707:
;708:#ifdef MISSIONPACK
;709:	if( g_gametype.integer == GT_1FCTF ) {
;710:		enemy_flag = PW_NEUTRALFLAG;
;711:	}
;712:	else {
;713:#endif
;714:	if (cl->sess.sessionTeam == TEAM_RED) {
ADDRLP4 8
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 1
NEI4 $369
line 715
;715:		enemy_flag = PW_BLUEFLAG;
ADDRLP4 12
CNSTI4 8
ASGNI4
line 716
;716:	} else {
ADDRGP4 $370
JUMPV
LABELV $369
line 717
;717:		enemy_flag = PW_REDFLAG;
ADDRLP4 12
CNSTI4 7
ASGNI4
line 718
;718:	}
LABELV $370
line 720
;719:
;720:	if ( ent->flags & FL_DROPPED_ITEM ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $371
line 722
;721:		// hey, its not home.  return it by teleporting it back
;722:		PrintMsg( NULL, "%s" S_COLOR_WHITE " returned the %s flag!\n", 
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $373
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 724
;723:			cl->pers.netname, TeamName(team));
;724:		AddScore(other, ent->r.currentOrigin, CTF_RECOVERY_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 725
;725:		other->client->pers.teamState.flagrecovery++;
ADDRLP4 20
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 576
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 726
;726:		other->client->pers.teamState.lastreturnedflag = level.time;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 592
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 728
;727:		//ResetFlag will remove this entity!  We must return zero
;728:		Team_ReturnFlagSound(Team_ResetFlag(team), team);
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Team_ResetFlag
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_ReturnFlagSound
CALLV
pop
line 729
;729:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $368
JUMPV
LABELV $371
line 737
;730:	}
;731:#ifdef MISSIONPACK
;732:	}
;733:#endif
;734:
;735:	// the flag is at home base.  if the player has the enemy
;736:	// flag, he's just won!
;737:	if (!cl->ps.powerups[enemy_flag])
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $375
line 738
;738:		return 0; // We don't have the flag
CNSTI4 0
RETI4
ADDRGP4 $368
JUMPV
LABELV $375
line 745
;739:#ifdef MISSIONPACK
;740:	if( g_gametype.integer == GT_1FCTF ) {
;741:		PrintMsg( NULL, "%s" S_COLOR_WHITE " captured the flag!\n", cl->pers.netname );
;742:	}
;743:	else {
;744:#endif
;745:	PrintMsg( NULL, "%s" S_COLOR_WHITE " captured the %s flag!\n", cl->pers.netname, TeamName(OtherTeam(team)));
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 OtherTeam
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 750
;746:#ifdef MISSIONPACK
;747:	}
;748:#endif
;749:
;750:	cl->ps.powerups[enemy_flag] = 0;
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 752
;751:
;752:	teamgame.last_flag_capture = level.time;
ADDRGP4 teamgame
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 753
;753:	teamgame.last_capture_team = team;
ADDRGP4 teamgame+4
ADDRFP4 8
INDIRI4
ASGNI4
line 756
;754:
;755:	// Increase the team's score
;756:	AddTeamScore(ent->s.pos.trBase, other->client->sess.sessionTeam, 1);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 757
;757:	Team_ForceGesture(other->client->sess.sessionTeam);
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ARGI4
ADDRGP4 Team_ForceGesture
CALLV
pop
line 759
;758:
;759:	other->client->pers.teamState.captures++;
ADDRLP4 24
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 564
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 761
;760:	// add the sprite over the player's head
;761:	other->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 28
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 762
;762:	other->client->ps.eFlags |= EF_AWARD_CAP;
ADDRLP4 32
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 763
;763:	other->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 764
;764:	other->client->ps.persistant[PERS_CAPTURES]++;
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 304
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 767
;765:
;766:	// other gets another 10 frag bonus
;767:	AddScore(other, ent->r.currentOrigin, CTF_CAPTURE_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 5
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 769
;768:
;769:	Team_CaptureFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_CaptureFlagSound
CALLV
pop
line 772
;770:
;771:	// Ok, let's do the player loop, hand out the bonuses
;772:	for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $384
JUMPV
LABELV $381
line 773
;773:		player = &g_entities[i];
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 774
;774:		if (!player->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $386
line 775
;775:			continue;
ADDRGP4 $382
JUMPV
LABELV $386
line 777
;776:
;777:		if (player->client->sess.sessionTeam !=
ADDRLP4 40
CNSTI4 616
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 40
INDIRI4
ADDP4
INDIRI4
EQI4 $388
line 778
;778:			cl->sess.sessionTeam) {
line 779
;779:			player->client->pers.teamState.lasthurtcarrier = -5;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 588
ADDP4
CNSTF4 3231711232
ASGNF4
line 780
;780:		} else if (player->client->sess.sessionTeam ==
ADDRGP4 $389
JUMPV
LABELV $388
ADDRLP4 44
CNSTI4 616
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
ADDRLP4 44
INDIRI4
ADDP4
INDIRI4
NEI4 $390
line 781
;781:			cl->sess.sessionTeam) {
line 782
;782:			if (player != other)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
EQU4 $392
line 783
;783:				AddScore(player, ent->r.currentOrigin, CTF_TEAM_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 AddScore
CALLV
pop
LABELV $392
line 785
;784:			// award extra points for capture assists
;785:			if (player->client->pers.teamState.lastreturnedflag + 
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 592
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $394
line 786
;786:				CTF_RETURN_FLAG_ASSIST_TIMEOUT > level.time) {
line 787
;787:				AddScore (player, ent->r.currentOrigin, CTF_RETURN_FLAG_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 788
;788:				other->client->pers.teamState.assists++;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 584
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 790
;789:
;790:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 792
;791:				// add the sprite over the player's head
;792:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 793
;793:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 794
;794:				player->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 796
;795:
;796:			} else if (player->client->pers.teamState.lastfraggedcarrier + 
ADDRGP4 $395
JUMPV
LABELV $394
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
INDIRF4
CNSTF4 1176256512
ADDF4
ADDRGP4 level+32
INDIRI4
CVIF4 4
LEF4 $398
line 797
;797:				CTF_FRAG_CARRIER_ASSIST_TIMEOUT > level.time) {
line 798
;798:				AddScore(player, ent->r.currentOrigin, CTF_FRAG_CARRIER_ASSIST_BONUS);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 799
;799:				other->client->pers.teamState.assists++;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 584
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 800
;800:				player->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 802
;801:				// add the sprite over the player's head
;802:				player->client->ps.eFlags &= ~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP );
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 803
;803:				player->client->ps.eFlags |= EF_AWARD_ASSIST;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 131072
BORI4
ASGNI4
line 804
;804:				player->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 805
;805:			}
LABELV $398
LABELV $395
line 806
;806:		}
LABELV $390
LABELV $389
line 807
;807:	}
LABELV $382
line 772
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $384
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $381
line 808
;808:	Team_ResetFlags();
ADDRGP4 Team_ResetFlags
CALLV
pop
line 810
;809:
;810:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 812
;811:
;812:	return 0; // Do not respawn this automatically
CNSTI4 0
RETI4
LABELV $368
endproc Team_TouchOurFlag 64 16
export Team_TouchEnemyFlag
proc Team_TouchEnemyFlag 8 16
line 815
;813:}
;814:
;815:int Team_TouchEnemyFlag( gentity_t *ent, gentity_t *other, int team ) {
line 816
;816:	gclient_t *cl = other->client;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 833
;817:
;818:#ifdef MISSIONPACK
;819:	if( g_gametype.integer == GT_1FCTF ) {
;820:		PrintMsg (NULL, "%s" S_COLOR_WHITE " got the flag!\n", other->client->pers.netname );
;821:
;822:		cl->ps.powerups[PW_NEUTRALFLAG] = INT_MAX; // flags never expire
;823:
;824:		if( team == TEAM_RED ) {
;825:			Team_SetFlagStatus( TEAM_FREE, FLAG_TAKEN_RED );
;826:		}
;827:		else {
;828:			Team_SetFlagStatus( TEAM_FREE, FLAG_TAKEN_BLUE );
;829:		}
;830:	}
;831:	else{
;832:#endif
;833:		PrintMsg (NULL, "%s" S_COLOR_WHITE " got the %s flag!\n",
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 TeamName
CALLP4
ASGNP4
CNSTP4 0
ARGP4
ADDRGP4 $403
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 512
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 836
;834:			other->client->pers.netname, TeamName(team));
;835:
;836:		if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $404
line 837
;837:			cl->ps.powerups[PW_REDFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 2147483647
ASGNI4
ADDRGP4 $405
JUMPV
LABELV $404
line 839
;838:		else
;839:			cl->ps.powerups[PW_BLUEFLAG] = INT_MAX; // flags never expire
ADDRLP4 0
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 2147483647
ASGNI4
LABELV $405
line 841
;840:
;841:		Team_SetFlagStatus( team, FLAG_TAKEN );
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Team_SetFlagStatus
CALLV
pop
line 846
;842:#ifdef MISSIONPACK
;843:	}
;844:#endif
;845:
;846:	AddScore(other, ent->r.currentOrigin, CTF_FLAG_BONUS);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 847
;847:	cl->pers.teamState.flagsince = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 596
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ASGNF4
line 848
;848:	Team_TakeFlagSound( ent, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Team_TakeFlagSound
CALLV
pop
line 850
;849:
;850:	return -1; // Do not respawn this automatically, but do delete it if it was FL_DROPPED
CNSTI4 -1
RETI4
LABELV $402
endproc Team_TouchEnemyFlag 8 16
export Pickup_Team
proc Pickup_Team 20 12
line 853
;851:}
;852:
;853:int Pickup_Team( gentity_t *ent, gentity_t *other ) {
line 855
;854:	int team;
;855:	gclient_t *cl = other->client;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 874
;856:
;857:#ifdef MISSIONPACK
;858:	if( g_gametype.integer == GT_OBELISK ) {
;859:		// there are no team items that can be picked up in obelisk
;860:		G_FreeEntity( ent );
;861:		return 0;
;862:	}
;863:
;864:	if( g_gametype.integer == GT_HARVESTER ) {
;865:		// the only team items that can be picked up in harvester are the cubes
;866:		if( ent->spawnflags != cl->sess.sessionTeam ) {
;867:			cl->ps.generic1 += 1;
;868:		}
;869:		G_FreeEntity( ent );
;870:		return 0;
;871:	}
;872:#endif
;873:	// figure out what team this flag is
;874:	if( strcmp(ent->classname, "team_CTF_redflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $244
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $408
line 875
;875:		team = TEAM_RED;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 876
;876:	}
ADDRGP4 $409
JUMPV
LABELV $408
line 877
;877:	else if( strcmp(ent->classname, "team_CTF_blueflag") == 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $246
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $410
line 878
;878:		team = TEAM_BLUE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 879
;879:	}
ADDRGP4 $411
JUMPV
LABELV $410
line 885
;880:#ifdef MISSIONPACK
;881:	else if( strcmp(ent->classname, "team_CTF_neutralflag") == 0  ) {
;882:		team = TEAM_FREE;
;883:	}
;884:#endif
;885:	else {
line 886
;886:		PrintMsg ( other, "Don't know what team the flag is on.\n");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $412
ARGP4
ADDRGP4 PrintMsg
CALLV
pop
line 887
;887:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $407
JUMPV
LABELV $411
LABELV $409
line 901
;888:	}
;889:#ifdef MISSIONPACK
;890:	if( g_gametype.integer == GT_1FCTF ) {
;891:		if( team == TEAM_FREE ) {
;892:			return Team_TouchEnemyFlag( ent, other, cl->sess.sessionTeam );
;893:		}
;894:		if( team != cl->sess.sessionTeam) {
;895:			return Team_TouchOurFlag( ent, other, cl->sess.sessionTeam );
;896:		}
;897:		return 0;
;898:	}
;899:#endif
;900:	// GT_CTF
;901:	if( team == cl->sess.sessionTeam) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
NEI4 $413
line 902
;902:		return Team_TouchOurFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 Team_TouchOurFlag
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $407
JUMPV
LABELV $413
line 904
;903:	}
;904:	return Team_TouchEnemyFlag( ent, other, team );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 Team_TouchEnemyFlag
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
LABELV $407
endproc Pickup_Team 20 12
export Team_GetLocation
proc Team_GetLocation 48 8
line 915
;905:}
;906:
;907:/*
;908:===========
;909:Team_GetLocation
;910:
;911:Report a location for the player. Uses placed nearby target_location entities
;912:============
;913:*/
;914:gentity_t *Team_GetLocation(gentity_t *ent)
;915:{
line 920
;916:	gentity_t		*eloc, *best;
;917:	float			bestlen, len;
;918:	vec3_t			origin;
;919:
;920:	best = NULL;
ADDRLP4 24
CNSTP4 0
ASGNP4
line 921
;921:	bestlen = 3*8192.0*8192.0;
ADDRLP4 20
CNSTF4 1296039936
ASGNF4
line 923
;922:
;923:	VectorCopy( ent->r.currentOrigin, origin );
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 925
;924:
;925:	for (eloc = level.locationHead; eloc; eloc = eloc->nextTrain) {
ADDRLP4 0
ADDRGP4 level+9172
INDIRP4
ASGNP4
ADDRGP4 $419
JUMPV
LABELV $416
line 926
;926:		len = ( origin[0] - eloc->r.currentOrigin[0] ) * ( origin[0] - eloc->r.currentOrigin[0] )
ADDRLP4 32
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ASGNF4
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 32
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 36
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 40
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 930
;927:			+ ( origin[1] - eloc->r.currentOrigin[1] ) * ( origin[1] - eloc->r.currentOrigin[1] )
;928:			+ ( origin[2] - eloc->r.currentOrigin[2] ) * ( origin[2] - eloc->r.currentOrigin[2] );
;929:
;930:		if ( len > bestlen ) {
ADDRLP4 16
INDIRF4
ADDRLP4 20
INDIRF4
LEF4 $425
line 931
;931:			continue;
ADDRGP4 $417
JUMPV
LABELV $425
line 934
;932:		}
;933:
;934:		if ( !trap_InPVS( origin, eloc->r.currentOrigin ) ) {
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 trap_InPVS
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $427
line 935
;935:			continue;
ADDRGP4 $417
JUMPV
LABELV $427
line 938
;936:		}
;937:
;938:		bestlen = len;
ADDRLP4 20
ADDRLP4 16
INDIRF4
ASGNF4
line 939
;939:		best = eloc;
ADDRLP4 24
ADDRLP4 0
INDIRP4
ASGNP4
line 940
;940:	}
LABELV $417
line 925
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
ASGNP4
LABELV $419
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $416
line 942
;941:
;942:	return best;
ADDRLP4 24
INDIRP4
RETP4
LABELV $415
endproc Team_GetLocation 48 8
export Team_GetLocationMsg
proc Team_GetLocationMsg 12 24
line 954
;943:}
;944:
;945:
;946:/*
;947:===========
;948:Team_GetLocation
;949:
;950:Report a location for the player. Uses placed nearby target_location entities
;951:============
;952:*/
;953:qboolean Team_GetLocationMsg(gentity_t *ent, char *loc, int loclen)
;954:{
line 957
;955:	gentity_t *best;
;956:
;957:	best = Team_GetLocation( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 959
;958:	
;959:	if (!best)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $430
line 960
;960:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $429
JUMPV
LABELV $430
line 962
;961:
;962:	if (best->count) {
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $432
line 963
;963:		if (best->count < 0)
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
GEI4 $434
line 964
;964:			best->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
LABELV $434
line 965
;965:		if (best->count > 7)
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 7
LEI4 $436
line 966
;966:			best->count = 7;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 7
ASGNI4
LABELV $436
line 967
;967:		Com_sprintf(loc, loclen, "%c%c%s" S_COLOR_WHITE, Q_COLOR_ESCAPE, best->count + '0', best->message );
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $438
ARGP4
CNSTI4 94
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
line 968
;968:	} else
ADDRGP4 $433
JUMPV
LABELV $432
line 969
;969:		Com_sprintf(loc, loclen, "%s", best->message);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $439
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLV
pop
LABELV $433
line 971
;970:
;971:	return qtrue;
CNSTI4 1
RETI4
LABELV $429
endproc Team_GetLocationMsg 12 24
export SelectRandomTeamSpawnPoint
proc SelectRandomTeamSpawnPoint 152 12
line 985
;972:}
;973:
;974:
;975:/*---------------------------------------------------------------------------*/
;976:
;977:/*
;978:================
;979:SelectRandomDeathmatchSpawnPoint
;980:
;981:go to a random point that doesn't telefrag
;982:================
;983:*/
;984:#define	MAX_TEAM_SPAWN_POINTS	32
;985:gentity_t *SelectRandomTeamSpawnPoint( int teamstate, team_t team ) {
line 992
;986:	gentity_t	*spot;
;987:	int			count;
;988:	int			selection;
;989:	gentity_t	*spots[MAX_TEAM_SPAWN_POINTS];
;990:	char		*classname;
;991:
;992:	if (teamstate == TEAM_BEGIN) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $441
line 993
;993:		if (team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $443
line 994
;994:			classname = "team_CTF_redplayer";
ADDRLP4 8
ADDRGP4 $445
ASGNP4
ADDRGP4 $442
JUMPV
LABELV $443
line 995
;995:		else if (team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $446
line 996
;996:			classname = "team_CTF_blueplayer";
ADDRLP4 8
ADDRGP4 $448
ASGNP4
ADDRGP4 $442
JUMPV
LABELV $446
line 998
;997:		else
;998:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $440
JUMPV
line 999
;999:	} else {
LABELV $441
line 1000
;1000:		if (team == TEAM_RED)
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $449
line 1001
;1001:			classname = "team_CTF_redspawn";
ADDRLP4 8
ADDRGP4 $451
ASGNP4
ADDRGP4 $450
JUMPV
LABELV $449
line 1002
;1002:		else if (team == TEAM_BLUE)
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $452
line 1003
;1003:			classname = "team_CTF_bluespawn";
ADDRLP4 8
ADDRGP4 $454
ASGNP4
ADDRGP4 $453
JUMPV
LABELV $452
line 1005
;1004:		else
;1005:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $440
JUMPV
LABELV $453
LABELV $450
line 1006
;1006:	}
LABELV $442
line 1007
;1007:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1009
;1008:
;1009:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $456
JUMPV
LABELV $455
line 1011
;1010:
;1011:	while ((spot = G_Find (spot, FOFS(classname), classname)) != NULL) {
line 1012
;1012:		if ( SpotWouldTelefrag( spot ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $458
line 1013
;1013:			continue;
ADDRGP4 $456
JUMPV
LABELV $458
line 1015
;1014:		}
;1015:		spots[ count ] = spot;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1016
;1016:		if (++count == MAX_TEAM_SPAWN_POINTS)
ADDRLP4 148
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 32
NEI4 $460
line 1017
;1017:			break;
ADDRGP4 $457
JUMPV
LABELV $460
line 1018
;1018:	}
LABELV $456
line 1011
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 144
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $455
LABELV $457
line 1020
;1019:
;1020:	if ( !count ) {	// no spots that won't telefrag
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $462
line 1021
;1021:		return G_Find( NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 148
INDIRP4
RETP4
ADDRGP4 $440
JUMPV
LABELV $462
line 1024
;1022:	}
;1023:
;1024:	selection = rand() % count;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 148
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
ASGNI4
line 1025
;1025:	return spots[ selection ];
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRP4
RETP4
LABELV $440
endproc SelectRandomTeamSpawnPoint 152 12
export SelectCTFSpawnPoint
proc SelectCTFSpawnPoint 12 12
line 1035
;1026:}
;1027:
;1028:
;1029:/*
;1030:===========
;1031:SelectCTFSpawnPoint
;1032:
;1033:============
;1034:*/
;1035:gentity_t *SelectCTFSpawnPoint ( team_t team, int teamstate, vec3_t origin, vec3_t angles ) {
line 1038
;1036:	gentity_t	*spot;
;1037:
;1038:	spot = SelectRandomTeamSpawnPoint ( teamstate, team );
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 SelectRandomTeamSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 1040
;1039:
;1040:	if (!spot) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $465
line 1041
;1041:		return SelectSpawnPoint( vec3_origin, origin, angles );
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
RETP4
ADDRGP4 $464
JUMPV
LABELV $465
line 1044
;1042:	}
;1043:
;1044:	VectorCopy (spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1045
;1045:	origin[2] += 9;
ADDRLP4 8
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 1046
;1046:	VectorCopy (spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1048
;1047:
;1048:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $464
endproc SelectCTFSpawnPoint 12 12
proc SortClients 0 0
line 1053
;1049:}
;1050:
;1051:/*---------------------------------------------------------------------------*/
;1052:
;1053:static int QDECL SortClients( const void *a, const void *b ) {
line 1054
;1054:	return *(int *)a - *(int *)b;
ADDRFP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
SUBI4
RETI4
LABELV $467
endproc SortClients 0 0
export TeamplayInfoMessage
proc TeamplayInfoMessage 9404 36
line 1067
;1055:}
;1056:
;1057:
;1058:/*
;1059:==================
;1060:TeamplayLocationsMessage
;1061:
;1062:Format:
;1063:	clientNum location health armor weapon powerups
;1064:
;1065:==================
;1066:*/
;1067:void TeamplayInfoMessage( gentity_t *ent ) {
line 1077
;1068:	char		entry[1024];
;1069:	char		string[8192];
;1070:	int			stringlength;
;1071:	int			i, j;
;1072:	gentity_t	*player;
;1073:	int			cnt;
;1074:	int			h, a;
;1075:	int			clients[TEAM_MAXOVERLAY];
;1076:
;1077:	if ( ! ent->client->pers.teamInfo )
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $469
line 1078
;1078:		return;
ADDRGP4 $468
JUMPV
LABELV $469
line 1083
;1079:
;1080:	// figure out what client should be on the display
;1081:	// we are limited to 8, but we want to use the top eight players
;1082:	// but in client order (so they don't keep changing position on the overlay)
;1083:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9372
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9372
INDIRI4
ASGNI4
ADDRGP4 $474
JUMPV
LABELV $471
line 1084
;1084:		player = g_entities + level.sortedClients[i];
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1085
;1085:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $477
ADDRLP4 9380
CNSTI4 516
ASGNI4
ADDRLP4 9384
CNSTI4 616
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9380
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRI4
NEI4 $477
line 1086
;1086:			ent->client->sess.sessionTeam ) {
line 1087
;1087:			clients[cnt++] = level.sortedClients[i];
ADDRLP4 9388
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9388
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 9392
CNSTI4 2
ASGNI4
ADDRLP4 9388
INDIRI4
ADDRLP4 9392
INDIRI4
LSHI4
ADDRLP4 9244
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 9392
INDIRI4
LSHI4
ADDRGP4 level+84
ADDP4
INDIRI4
ASGNI4
line 1088
;1088:		}
LABELV $477
line 1089
;1089:	}
LABELV $472
line 1083
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $474
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $480
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $471
LABELV $480
line 1092
;1090:
;1091:	// We have the top eight players, sort them by clientNum
;1092:	qsort( clients, cnt, sizeof( clients[0] ), SortClients );
ADDRLP4 9244
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortClients
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1095
;1093:
;1094:	// send the latest information on all clients
;1095:	string[0] = 0;
ADDRLP4 1052
CNSTI1 0
ASGNI1
line 1096
;1096:	stringlength = 0;
ADDRLP4 1044
CNSTI4 0
ASGNI4
line 1098
;1097:
;1098:	for (i = 0, cnt = 0; i < g_maxclients.integer && cnt < TEAM_MAXOVERLAY; i++) {
ADDRLP4 9376
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 9376
INDIRI4
ASGNI4
ADDRGP4 $484
JUMPV
LABELV $481
line 1099
;1099:		player = g_entities + i;
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1100
;1100:		if (player->inuse && player->client->sess.sessionTeam == 
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $486
ADDRLP4 9384
CNSTI4 516
ASGNI4
ADDRLP4 9388
CNSTI4 616
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
ADDRLP4 9384
INDIRI4
ADDP4
INDIRP4
ADDRLP4 9388
INDIRI4
ADDP4
INDIRI4
NEI4 $486
line 1101
;1101:			ent->client->sess.sessionTeam ) {
line 1103
;1102:
;1103:			h = player->client->ps.stats[STAT_HEALTH];
ADDRLP4 1036
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1104
;1104:			a = player->client->ps.stats[STAT_ARMOR];
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 1105
;1105:			if (h < 0) h = 0;
ADDRLP4 1036
INDIRI4
CNSTI4 0
GEI4 $488
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $488
line 1106
;1106:			if (a < 0) a = 0;
ADDRLP4 1040
INDIRI4
CNSTI4 0
GEI4 $490
ADDRLP4 1040
CNSTI4 0
ASGNI4
LABELV $490
line 1108
;1107:
;1108:			Com_sprintf (entry, sizeof(entry),
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $492
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 9396
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 9396
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRLP4 9396
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLV
pop
line 1113
;1109:				" %i %i %i %i %i %i", 
;1110://				level.sortedClients[i], player->client->pers.teamState.location, h, a, 
;1111:				i, player->client->pers.teamState.location, h, a, 
;1112:				player->client->ps.weapon, player->s.powerups);
;1113:			j = strlen(entry);
ADDRLP4 12
ARGP4
ADDRLP4 9400
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 9400
INDIRI4
ASGNI4
line 1114
;1114:			if (stringlength + j > sizeof(string))
ADDRLP4 1044
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
CVIU4 4
CNSTU4 8192
LEU4 $493
line 1115
;1115:				break;
ADDRGP4 $483
JUMPV
LABELV $493
line 1116
;1116:			strcpy (string + stringlength, entry);
ADDRLP4 1044
INDIRI4
ADDRLP4 1052
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1117
;1117:			stringlength += j;
ADDRLP4 1044
ADDRLP4 1044
INDIRI4
ADDRLP4 1048
INDIRI4
ADDI4
ASGNI4
line 1118
;1118:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1119
;1119:		}
LABELV $486
line 1120
;1120:	}
LABELV $482
line 1098
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $484
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
GEI4 $495
ADDRLP4 8
INDIRI4
CNSTI4 32
LTI4 $481
LABELV $495
LABELV $483
line 1122
;1121:
;1122:	trap_SendServerCommand( ent-g_entities, va("tinfo %i %s", cnt, string) );
ADDRGP4 $496
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 1052
ARGP4
ADDRLP4 9380
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 808
DIVI4
ARGI4
ADDRLP4 9380
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1123
;1123:}
LABELV $468
endproc TeamplayInfoMessage 9404 36
export CheckTeamStatus
proc CheckTeamStatus 24 4
line 1125
;1124:
;1125:void CheckTeamStatus(void) {
line 1129
;1126:	int i;
;1127:	gentity_t *loc, *ent;
;1128:
;1129:	if (level.time - level.lastTeamLocationTime > TEAM_LOCATION_UPDATE_TIME) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+60
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $498
line 1131
;1130:
;1131:		level.lastTeamLocationTime = level.time;
ADDRGP4 level+60
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1133
;1132:
;1133:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $507
JUMPV
LABELV $504
line 1134
;1134:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1136
;1135:
;1136:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $509
line 1137
;1137:				continue;
ADDRGP4 $505
JUMPV
LABELV $509
line 1140
;1138:			}
;1139:
;1140:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $511
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $513
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $511
LABELV $513
line 1141
;1141:				loc = Team_GetLocation( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Team_GetLocation
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1142
;1142:				if (loc)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $514
line 1143
;1143:					ent->client->pers.teamState.location = loc->health;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 560
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $515
JUMPV
LABELV $514
line 1145
;1144:				else
;1145:					ent->client->pers.teamState.location = 0;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
LABELV $515
line 1146
;1146:			}
LABELV $511
line 1147
;1147:		}
LABELV $505
line 1133
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $507
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $504
line 1149
;1148:
;1149:		for (i = 0; i < g_maxclients.integer; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $519
JUMPV
LABELV $516
line 1150
;1150:			ent = g_entities + i;
ADDRLP4 0
CNSTI4 808
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1152
;1151:
;1152:			if ( ent->client->pers.connected != CON_CONNECTED ) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $521
line 1153
;1153:				continue;
ADDRGP4 $517
JUMPV
LABELV $521
line 1156
;1154:			}
;1155:
;1156:			if (ent->inuse && (ent->client->sess.sessionTeam == TEAM_RED ||	ent->client->sess.sessionTeam == TEAM_BLUE)) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $523
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
EQI4 $525
ADDRLP4 16
INDIRI4
CNSTI4 2
NEI4 $523
LABELV $525
line 1157
;1157:				TeamplayInfoMessage( ent );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 TeamplayInfoMessage
CALLV
pop
line 1158
;1158:			}
LABELV $523
line 1159
;1159:		}
LABELV $517
line 1149
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $519
ADDRLP4 4
INDIRI4
ADDRGP4 g_maxclients+12
INDIRI4
LTI4 $516
line 1160
;1160:	}
LABELV $498
line 1161
;1161:}
LABELV $497
endproc CheckTeamStatus 24 4
export SP_team_CTF_redplayer
proc SP_team_CTF_redplayer 0 0
line 1168
;1162:
;1163:/*-----------------------------------------------------------------*/
;1164:
;1165:/*QUAKED team_CTF_redplayer (1 0 0) (-16 -16 -16) (16 16 32)
;1166:Only in CTF games.  Red players spawn here at game start.
;1167:*/
;1168:void SP_team_CTF_redplayer( gentity_t *ent ) {
line 1169
;1169:}
LABELV $526
endproc SP_team_CTF_redplayer 0 0
export SP_team_CTF_blueplayer
proc SP_team_CTF_blueplayer 0 0
line 1175
;1170:
;1171:
;1172:/*QUAKED team_CTF_blueplayer (0 0 1) (-16 -16 -16) (16 16 32)
;1173:Only in CTF games.  Blue players spawn here at game start.
;1174:*/
;1175:void SP_team_CTF_blueplayer( gentity_t *ent ) {
line 1176
;1176:}
LABELV $527
endproc SP_team_CTF_blueplayer 0 0
export SP_team_CTF_redspawn
proc SP_team_CTF_redspawn 0 0
line 1183
;1177:
;1178:
;1179:/*QUAKED team_CTF_redspawn (1 0 0) (-16 -16 -24) (16 16 32)
;1180:potential spawning position for red team in CTF games.
;1181:Targets will be fired when someone spawns in on them.
;1182:*/
;1183:void SP_team_CTF_redspawn(gentity_t *ent) {
line 1184
;1184:}
LABELV $528
endproc SP_team_CTF_redspawn 0 0
export SP_team_CTF_bluespawn
proc SP_team_CTF_bluespawn 0 0
line 1190
;1185:
;1186:/*QUAKED team_CTF_bluespawn (0 0 1) (-16 -16 -24) (16 16 32)
;1187:potential spawning position for blue team in CTF games.
;1188:Targets will be fired when someone spawns in on them.
;1189:*/
;1190:void SP_team_CTF_bluespawn(gentity_t *ent) {
line 1191
;1191:}
LABELV $529
endproc SP_team_CTF_bluespawn 0 0
bss
export neutralObelisk
align 4
LABELV neutralObelisk
skip 4
export teamgame
align 4
LABELV teamgame
skip 36
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Milliseconds
import trap_Error
import trap_Printf
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_rankings
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_teamAutoJoin
import g_allowVote
import g_blood
import g_doWarmup
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_restarted
import g_maxGameClients
import g_maxclients
import g_cheats
import g_dedicated
import g_gametype
import g_entities
import level
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_WriteSessionData
import G_InitWorldSession
import G_InitSessionData
import G_ReadSessionData
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import CheckObeliskAttack
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_Error
import G_Printf
import SendScoreboardMessageToAllClients
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import DeathmatchScoreboardMessage
import G_SetStats
import MoveClientToIntermission
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import InitClientResp
import InitClientPersistant
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamCount
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import Add_Ammo
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Pmove
import PM_UpdateViewAngles
import Com_Printf
import Com_Error
import Info_NextPair
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_RemoveKey_big
import Info_RemoveKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Com_Memcpy
import Com_Memset
import Hunk_Alloc
import FloatSwap
import LongSwap
import ShortSwap
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import sscanf
import vsprintf
import _atoi
import atoi
import _atof
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $496
byte 1 116
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $492
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $454
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $451
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $448
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $445
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $439
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $438
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $412
byte 1 68
byte 1 111
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 32
byte 1 119
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $403
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 103
byte 1 111
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $377
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $373
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $353
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $352
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $346
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $318
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 84
byte 1 97
byte 1 107
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $312
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 82
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $299
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 110
byte 1 101
byte 1 117
byte 1 116
byte 1 114
byte 1 97
byte 1 108
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $246
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $244
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $224
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $213
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 39
byte 1 115
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 99
byte 1 97
byte 1 114
byte 1 114
byte 1 105
byte 1 101
byte 1 114
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $102
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $97
byte 1 80
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 77
byte 1 115
byte 1 103
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 114
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $92
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $91
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $88
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $85
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $74
byte 1 70
byte 1 82
byte 1 69
byte 1 69
byte 1 0
align 1
LABELV $73
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $70
byte 1 66
byte 1 76
byte 1 85
byte 1 69
byte 1 0
align 1
LABELV $67
byte 1 82
byte 1 69
byte 1 68
byte 1 0
