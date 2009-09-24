export G_TestEntityPosition
code
proc G_TestEntityPosition 68 28
file "../g_mover.c"
line 55
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
;29:
;30:/*
;31:===============================================================================
;32:
;33:PUSHMOVE
;34:
;35:===============================================================================
;36:*/
;37:
;38:void MatchTeam( gentity_t *teamLeader, int moverState, int time );
;39:
;40:typedef struct {
;41:	gentity_t	*ent;
;42:	vec3_t	origin;
;43:	vec3_t	angles;
;44:	float	deltayaw;
;45:} pushed_t;
;46:pushed_t	pushed[MAX_GENTITIES], *pushed_p;
;47:
;48:
;49:/*
;50:============
;51:G_TestEntityPosition
;52:
;53:============
;54:*/
;55:gentity_t	*G_TestEntityPosition( gentity_t *ent ) {
line 59
;56:	trace_t	tr;
;57:	int		mask;
;58:
;59:	if ( ent->clipmask ) {
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
CNSTI4 0
EQI4 $54
line 60
;60:		mask = ent->clipmask;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ASGNI4
line 61
;61:	} else {
ADDRGP4 $55
JUMPV
LABELV $54
line 62
;62:		mask = MASK_SOLID;
ADDRLP4 56
CNSTI4 1
ASGNI4
line 63
;63:	}
LABELV $55
line 64
;64:	if ( ent->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $56
line 65
;65:		trap_Trace( &tr, ent->client->ps.origin, ent->r.mins, ent->r.maxs, ent->client->ps.origin, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 66
;66:	} else {
ADDRGP4 $57
JUMPV
LABELV $56
line 67
;67:		trap_Trace( &tr, ent->s.pos.trBase, ent->r.mins, ent->r.maxs, ent->s.pos.trBase, ent->s.number, mask );
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
INDIRI4
ARGI4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 68
;68:	}
LABELV $57
line 70
;69:	
;70:	if (tr.startsolid)
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $58
line 71
;71:		return &g_entities[ tr.entityNum ];
CNSTI4 808
ADDRLP4 0+52
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
RETP4
ADDRGP4 $53
JUMPV
LABELV $58
line 73
;72:		
;73:	return NULL;
CNSTP4 0
RETP4
LABELV $53
endproc G_TestEntityPosition 68 28
export G_CreateRotationMatrix
proc G_CreateRotationMatrix 4 16
line 81
;74:}
;75:
;76:/*
;77:================
;78:G_CreateRotationMatrix
;79:================
;80:*/
;81:void G_CreateRotationMatrix(vec3_t angles, vec3_t matrix[3]) {
line 82
;82:	AngleVectors(angles, matrix[0], matrix[1], matrix[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 83
;83:	VectorInverse(matrix[1]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 VectorInverse
CALLV
pop
line 84
;84:}
LABELV $62
endproc G_CreateRotationMatrix 4 16
export G_TransposeMatrix
proc G_TransposeMatrix 24 0
line 91
;85:
;86:/*
;87:================
;88:G_TransposeMatrix
;89:================
;90:*/
;91:void G_TransposeMatrix(vec3_t matrix[3], vec3_t transpose[3]) {
line 93
;92:	int i, j;
;93:	for (i = 0; i < 3; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $64
line 94
;94:		for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $68
line 95
;95:			transpose[i][j] = matrix[j][i];
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRLP4 16
CNSTI4 12
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRLP4 16
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRFP4 4
INDIRP4
ADDP4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LSHI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ADDP4
INDIRF4
ASGNF4
line 96
;96:		}
LABELV $69
line 94
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $68
line 97
;97:	}
LABELV $65
line 93
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $64
line 98
;98:}
LABELV $63
endproc G_TransposeMatrix 24 0
export G_RotatePoint
proc G_RotatePoint 24 0
line 105
;99:
;100:/*
;101:================
;102:G_RotatePoint
;103:================
;104:*/
;105:void G_RotatePoint(vec3_t point, vec3_t matrix[3]) {
line 108
;106:	vec3_t tvec;
;107:
;108:	VectorCopy(point, tvec);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 109
;109:	point[0] = DotProduct(matrix[0], tvec);
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 110
;110:	point[1] = DotProduct(matrix[1], tvec);
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 111
;111:	point[2] = DotProduct(matrix[2], tvec);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 112
;112:}
LABELV $72
endproc G_RotatePoint 24 0
export G_TryPushingEntity
proc G_TryPushingEntity 172 8
line 121
;113:
;114:/*
;115:==================
;116:G_TryPushingEntity
;117:
;118:Returns qfalse if the move is blocked
;119:==================
;120:*/
;121:qboolean	G_TryPushingEntity( gentity_t *check, gentity_t *pusher, vec3_t move, vec3_t amove ) {
line 128
;122:	vec3_t		matrix[3], transpose[3];
;123:	vec3_t		org, org2, move2;
;124:	gentity_t	*block;
;125:
;126:	// EF_MOVER_STOP will just stop when contacting another entity
;127:	// instead of pushing it, but entities can still ride on top of it
;128:	if ( ( pusher->s.eFlags & EF_MOVER_STOP ) && 
ADDRLP4 112
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $80
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 112
INDIRP4
INDIRI4
EQI4 $80
line 129
;129:		check->s.groundEntityNum != pusher->s.number ) {
line 130
;130:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $79
JUMPV
LABELV $80
line 134
;131:	}
;132:
;133:	// save off the old position
;134:	if (pushed_p > &pushed[MAX_GENTITIES]) {
ADDRGP4 pushed_p
INDIRP4
CVPU4 4
ADDRGP4 pushed+32768
CVPU4 4
LEU4 $82
line 135
;135:		G_Error( "pushed_p > &pushed[MAX_GENTITIES]" );
ADDRGP4 $85
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 136
;136:	}
LABELV $82
line 137
;137:	pushed_p->ent = check;
ADDRGP4 pushed_p
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
line 138
;138:	VectorCopy (check->s.pos.trBase, pushed_p->origin);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 139
;139:	VectorCopy (check->s.apos.trBase, pushed_p->angles);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 140
;140:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $86
line 141
;141:		pushed_p->deltayaw = check->client->ps.delta_angles[YAW];
ADDRGP4 pushed_p
INDIRP4
CNSTI4 28
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 142
;142:		VectorCopy (check->client->ps.origin, pushed_p->origin);
ADDRGP4 pushed_p
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 143
;143:	}
LABELV $86
line 144
;144:	pushed_p++;
ADDRLP4 116
ADDRGP4 pushed_p
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 148
;145:
;146:	// try moving the contacted entity 
;147:	// figure movement due to the pusher's amove
;148:	G_CreateRotationMatrix( amove, transpose );
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_CreateRotationMatrix
CALLV
pop
line 149
;149:	G_TransposeMatrix( transpose, matrix );
ADDRLP4 76
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 G_TransposeMatrix
CALLV
pop
line 150
;150:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $88
line 151
;151:		VectorSubtract (check->client->ps.origin, pusher->r.currentOrigin, org);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ASGNP4
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 152
;152:	}
ADDRGP4 $89
JUMPV
LABELV $88
line 153
;153:	else {
line 154
;154:		VectorSubtract (check->s.pos.trBase, pusher->r.currentOrigin, org);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 120
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 120
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 124
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 155
;155:	}
LABELV $89
line 156
;156:	VectorCopy( org, org2 );
ADDRLP4 24
ADDRLP4 12
INDIRB
ASGNB 12
line 157
;157:	G_RotatePoint( org2, matrix );
ADDRLP4 24
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 G_RotatePoint
CALLV
pop
line 158
;158:	VectorSubtract (org2, org, move2);
ADDRLP4 0
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 12+8
INDIRF4
SUBF4
ASGNF4
line 160
;159:	// add movement
;160:	VectorAdd (check->s.pos.trBase, move, check->s.pos.trBase);
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 128
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 161
;161:	VectorAdd (check->s.pos.trBase, move2, check->s.pos.trBase);
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 136
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 136
INDIRP4
ADDRLP4 136
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 162
;162:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $102
line 163
;163:		VectorAdd (check->client->ps.origin, move, check->client->ps.origin);
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 164
;164:		VectorAdd (check->client->ps.origin, move2, check->client->ps.origin);
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 164
INDIRP4
ADDRLP4 164
INDIRP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 166
;165:		// make sure the client's view rotates when on a rotating mover
;166:		check->client->ps.delta_angles[YAW] += ANGLE2SHORT(amove[YAW]);
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
ADDRLP4 168
INDIRP4
INDIRI4
CNSTF4 1199570944
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
CNSTF4 1135869952
DIVF4
CVFI4 4
CNSTI4 65535
BANDI4
ADDI4
ASGNI4
line 167
;167:	}
LABELV $102
line 170
;168:
;169:	// may have pushed them off an edge
;170:	if ( check->s.groundEntityNum != pusher->s.number ) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
INDIRI4
EQI4 $106
line 171
;171:		check->s.groundEntityNum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 -1
ASGNI4
line 172
;172:	}
LABELV $106
line 174
;173:
;174:	block = G_TestEntityPosition( check );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 144
INDIRP4
ASGNP4
line 175
;175:	if (!block) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $108
line 177
;176:		// pushed ok
;177:		if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $110
line 178
;178:			VectorCopy( check->client->ps.origin, check->r.currentOrigin );
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 179
;179:		} else {
ADDRGP4 $111
JUMPV
LABELV $110
line 180
;180:			VectorCopy( check->s.pos.trBase, check->r.currentOrigin );
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 148
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 181
;181:		}
LABELV $111
line 182
;182:		trap_LinkEntity (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 183
;183:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $79
JUMPV
LABELV $108
line 189
;184:	}
;185:
;186:	// if it is ok to leave in the old position, do it
;187:	// this is only relevent for riding entities, not pushed
;188:	// Sliding trapdoors can cause this.
;189:	VectorCopy( (pushed_p-1)->origin, check->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -28
ADDP4
INDIRB
ASGNB 12
line 190
;190:	if ( check->client ) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $112
line 191
;191:		VectorCopy( (pushed_p-1)->origin, check->client->ps.origin);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -28
ADDP4
INDIRB
ASGNB 12
line 192
;192:	}
LABELV $112
line 193
;193:	VectorCopy( (pushed_p-1)->angles, check->s.apos.trBase );
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -16
ADDP4
INDIRB
ASGNB 12
line 194
;194:	block = G_TestEntityPosition (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 148
INDIRP4
ASGNP4
line 195
;195:	if ( !block ) {
ADDRLP4 36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $114
line 196
;196:		check->s.groundEntityNum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 -1
ASGNI4
line 197
;197:		pushed_p--;
ADDRLP4 152
ADDRGP4 pushed_p
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
line 198
;198:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $79
JUMPV
LABELV $114
line 202
;199:	}
;200:
;201:	// blocked
;202:	return qfalse;
CNSTI4 0
RETI4
LABELV $79
endproc G_TryPushingEntity 172 8
export G_CheckProxMinePosition
proc G_CheckProxMinePosition 108 28
line 210
;203:}
;204:
;205:/*
;206:==================
;207:G_CheckProxMinePosition
;208:==================
;209:*/
;210:qboolean G_CheckProxMinePosition( gentity_t *check ) {
line 214
;211:	vec3_t		start, end;
;212:	trace_t	tr;
;213:
;214:	VectorMA(check->s.pos.trBase, 0.125, check->movedir, start);
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
CNSTF4 1040187392
ASGNF4
ADDRLP4 0
ADDRLP4 80
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 84
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 88
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1040187392
ADDRLP4 88
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 215
;215:	VectorMA(check->s.pos.trBase, 2, check->movedir, end);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
CNSTF4 1073741824
ASGNF4
ADDRLP4 12
ADDRLP4 92
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 92
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 96
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 100
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1073741824
ADDRLP4 100
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 216
;216:	trap_Trace( &tr, start, NULL, NULL, end, check->s.number, MASK_SOLID );
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 104
CNSTP4 0
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 218
;217:	
;218:	if (tr.startsolid || tr.fraction < 1)
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $125
ADDRLP4 24+8
INDIRF4
CNSTF4 1065353216
GEF4 $121
LABELV $125
line 219
;219:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $116
JUMPV
LABELV $121
line 221
;220:
;221:	return qtrue;
CNSTI4 1
RETI4
LABELV $116
endproc G_CheckProxMinePosition 108 28
export G_TryPushingProxMine
proc G_TryPushingProxMine 120 16
line 229
;222:}
;223:
;224:/*
;225:==================
;226:G_TryPushingProxMine
;227:==================
;228:*/
;229:qboolean G_TryPushingProxMine( gentity_t *check, gentity_t *pusher, vec3_t move, vec3_t amove ) {
line 235
;230:	vec3_t		forward, right, up;
;231:	vec3_t		org, org2, move2;
;232:	int ret;
;233:
;234:	// we need this for pushing things later
;235:	VectorSubtract (vec3_origin, amove, org);
ADDRLP4 76
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 76
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 236
;236:	AngleVectors (org, forward, right, up);
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 60
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 239
;237:
;238:	// try moving the contacted entity 
;239:	VectorAdd (check->s.pos.trBase, move, check->s.pos.trBase);
ADDRLP4 80
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 242
;240:
;241:	// figure movement due to the pusher's amove
;242:	VectorSubtract (check->s.pos.trBase, pusher->r.currentOrigin, org);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 92
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 92
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 243
;243:	org2[0] = DotProduct (org, forward);
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 244
;244:	org2[1] = -DotProduct (org, right);
ADDRLP4 12+4
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 48+8
INDIRF4
MULF4
ADDF4
NEGF4
ASGNF4
line 245
;245:	org2[2] = DotProduct (org, up);
ADDRLP4 12+8
ADDRLP4 0
INDIRF4
ADDRLP4 60
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 60+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 60+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 246
;246:	VectorSubtract (org2, org, move2);
ADDRLP4 24
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 247
;247:	VectorAdd (check->s.pos.trBase, move2, check->s.pos.trBase);
ADDRLP4 100
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 104
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 249
;248:
;249:	ret = G_CheckProxMinePosition( check );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 G_CheckProxMinePosition
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 112
INDIRI4
ASGNI4
line 250
;250:	if (ret) {
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $155
line 251
;251:		VectorCopy( check->s.pos.trBase, check->r.currentOrigin );
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 116
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 252
;252:		trap_LinkEntity (check);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 253
;253:	}
LABELV $155
line 254
;254:	return (qboolean)ret; // ***GREGS_VC9_PORT_MOD*** -- added typecast(s)
ADDRLP4 72
INDIRI4
RETI4
LABELV $126
endproc G_TryPushingProxMine 120 16
export G_MoverPush
proc G_MoverPush 4240 32
line 268
;255:}
;256:
;257:void G_ExplodeMissile( gentity_t *ent );
;258:
;259:/*
;260:============
;261:G_MoverPush
;262:
;263:Objects need to be moved back on a failed push,
;264:otherwise riders would continue to slide.
;265:If qfalse is returned, *obstacle will be the blocking entity
;266:============
;267:*/
;268:qboolean G_MoverPush( gentity_t *pusher, vec3_t move, vec3_t amove, gentity_t **obstacle ) {
line 277
;269:	int			i, e;
;270:	gentity_t	*check;
;271:	vec3_t		mins, maxs;
;272:	pushed_t	*p;
;273:	int			entityList[MAX_GENTITIES];
;274:	int			listedEntities;
;275:	vec3_t		totalMins, totalMaxs;
;276:
;277:	*obstacle = NULL;
ADDRFP4 12
INDIRP4
CNSTP4 0
ASGNP4
line 282
;278:
;279:
;280:	// mins/maxs are the bounds at the destination
;281:	// totalMins / totalMaxs are the bounds for the entire move
;282:	if ( pusher->r.currentAngles[0] || pusher->r.currentAngles[1] || pusher->r.currentAngles[2]
ADDRLP4 4164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4168
CNSTF4 0
ASGNF4
ADDRLP4 4164
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $164
ADDRLP4 4164
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $164
ADDRLP4 4164
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $164
ADDRLP4 4172
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 4172
INDIRP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $164
ADDRLP4 4172
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
NEF4 $164
ADDRLP4 4172
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4168
INDIRF4
EQF4 $158
LABELV $164
line 283
;283:		|| amove[0] || amove[1] || amove[2] ) {
line 286
;284:		float		radius;
;285:
;286:		radius = RadiusFromBounds( pusher->r.mins, pusher->r.maxs );
ADDRLP4 4180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4180
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 4180
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 4184
ADDRGP4 RadiusFromBounds
CALLF4
ASGNF4
ADDRLP4 4176
ADDRLP4 4184
INDIRF4
ASGNF4
line 287
;287:		for ( i = 0 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $165
line 288
;288:			mins[i] = pusher->r.currentOrigin[i] + move[i] - radius;
ADDRLP4 4188
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4188
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 4188
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDP4
INDIRF4
ADDRLP4 4188
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ADDRLP4 4176
INDIRF4
SUBF4
ASGNF4
line 289
;289:			maxs[i] = pusher->r.currentOrigin[i] + move[i] + radius;
ADDRLP4 4192
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4192
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4192
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDP4
INDIRF4
ADDRLP4 4192
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ADDRLP4 4176
INDIRF4
ADDF4
ASGNF4
line 290
;290:			totalMins[i] = mins[i] - move[i];
ADDRLP4 4196
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4196
INDIRI4
ADDRLP4 4140
ADDP4
ADDRLP4 4196
INDIRI4
ADDRLP4 16
ADDP4
INDIRF4
ADDRLP4 4196
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 291
;291:			totalMaxs[i] = maxs[i] - move[i];
ADDRLP4 4200
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4200
INDIRI4
ADDRLP4 4152
ADDP4
ADDRLP4 4200
INDIRI4
ADDRLP4 28
ADDP4
INDIRF4
ADDRLP4 4200
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 292
;292:		}
LABELV $166
line 287
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $165
line 293
;293:	} else {
ADDRGP4 $159
JUMPV
LABELV $158
line 294
;294:		for (i=0 ; i<3 ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $169
line 295
;295:			mins[i] = pusher->r.absmin[i] + move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4176
INDIRI4
ADDRLP4 16
ADDP4
ADDRLP4 4176
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 296
;296:			maxs[i] = pusher->r.absmax[i] + move[i];
ADDRLP4 4180
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
INDIRI4
ADDRLP4 28
ADDP4
ADDRLP4 4180
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
ADDRLP4 4180
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 297
;297:		}
LABELV $170
line 294
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $169
line 299
;298:
;299:		VectorCopy( pusher->r.absmin, totalMins );
ADDRLP4 4140
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 300
;300:		VectorCopy( pusher->r.absmax, totalMaxs );
ADDRLP4 4152
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 301
;301:		for (i=0 ; i<3 ; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $173
line 302
;302:			if ( move[i] > 0 ) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $177
line 303
;303:				totalMaxs[i] += move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
ADDRLP4 4176
INDIRI4
ADDRLP4 4152
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 304
;304:			} else {
ADDRGP4 $178
JUMPV
LABELV $177
line 305
;305:				totalMins[i] += move[i];
ADDRLP4 4176
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 4180
ADDRLP4 4176
INDIRI4
ADDRLP4 4140
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRLP4 4176
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 306
;306:			}
LABELV $178
line 307
;307:		}
LABELV $174
line 301
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $173
line 308
;308:	}
LABELV $159
line 311
;309:
;310:	// unlink the pusher so we don't get it in the entityList
;311:	trap_UnlinkEntity( pusher );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 313
;312:
;313:	listedEntities = trap_EntitiesInBox( totalMins, totalMaxs, entityList, MAX_GENTITIES );
ADDRLP4 4140
ARGP4
ADDRLP4 4152
ARGP4
ADDRLP4 40
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4176
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4136
ADDRLP4 4176
INDIRI4
ASGNI4
line 316
;314:
;315:	// move the pusher to it's final position
;316:	VectorAdd( pusher->r.currentOrigin, move, pusher->r.currentOrigin );
ADDRLP4 4180
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 4180
INDIRP4
ADDRLP4 4180
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4184
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
ASGNP4
ADDRLP4 4184
INDIRP4
ADDRLP4 4184
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4188
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
ASGNP4
ADDRLP4 4188
INDIRP4
ADDRLP4 4188
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 317
;317:	VectorAdd( pusher->r.currentAngles, amove, pusher->r.currentAngles );
ADDRLP4 4192
ADDRFP4 0
INDIRP4
CNSTI4 500
ADDP4
ASGNP4
ADDRLP4 4192
INDIRP4
ADDRLP4 4192
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4196
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
ASGNP4
ADDRLP4 4196
INDIRP4
ADDRLP4 4196
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4200
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ASGNP4
ADDRLP4 4200
INDIRP4
ADDRLP4 4200
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 318
;318:	trap_LinkEntity( pusher );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 321
;319:
;320:	// see if any solid entities are inside the final position
;321:	for ( e = 0 ; e < listedEntities ; e++ ) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $182
JUMPV
LABELV $179
line 322
;322:		check = &g_entities[ entityList[ e ] ];
ADDRLP4 8
CNSTI4 808
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 40
ADDP4
INDIRI4
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 361
;323:
;324:#ifdef MISSIONPACK
;325:		if ( check->s.eType == ET_MISSILE ) {
;326:			// if it is a prox mine
;327:			if ( !strcmp(check->classname, "prox mine") ) {
;328:				// if this prox mine is attached to this mover try to move it with the pusher
;329:				if ( check->enemy == pusher ) {
;330:					if (!G_TryPushingProxMine( check, pusher, move, amove )) {
;331:						//explode
;332:						check->s.loopSound = 0;
;333:						G_AddEvent( check, EV_PROXIMITY_MINE_TRIGGER, 0 );
;334:						G_ExplodeMissile(check);
;335:						if (check->activator) {
;336:							G_FreeEntity(check->activator);
;337:							check->activator = NULL;
;338:						}
;339:						//G_Printf("prox mine explodes\n");
;340:					}
;341:				}
;342:				else {
;343:					//check if the prox mine is crushed by the mover
;344:					if (!G_CheckProxMinePosition( check )) {
;345:						//explode
;346:						check->s.loopSound = 0;
;347:						G_AddEvent( check, EV_PROXIMITY_MINE_TRIGGER, 0 );
;348:						G_ExplodeMissile(check);
;349:						if (check->activator) {
;350:							G_FreeEntity(check->activator);
;351:							check->activator = NULL;
;352:						}
;353:						//G_Printf("prox mine explodes\n");
;354:					}
;355:				}
;356:				continue;
;357:			}
;358:		}
;359:#endif
;360:		// only push items and players
;361:		if ( check->s.eType != ET_ITEM && check->s.eType != ET_PLAYER && !check->physicsObject ) {
ADDRLP4 4208
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4208
INDIRI4
CNSTI4 2
EQI4 $183
ADDRLP4 4208
INDIRI4
CNSTI4 1
EQI4 $183
ADDRLP4 8
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
NEI4 $183
line 362
;362:			continue;
ADDRGP4 $180
JUMPV
LABELV $183
line 366
;363:		}
;364:
;365:		// if the entity is standing on the pusher, it will definitely be moved
;366:		if ( check->s.groundEntityNum != pusher->s.number ) {
ADDRLP4 8
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
EQI4 $185
line 368
;367:			// see if the ent needs to be tested
;368:			if ( check->r.absmin[0] >= maxs[0]
ADDRLP4 8
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
GEF4 $197
ADDRLP4 8
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 28+4
INDIRF4
GEF4 $197
ADDRLP4 8
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 28+8
INDIRF4
GEF4 $197
ADDRLP4 8
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $197
ADDRLP4 8
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
LEF4 $197
ADDRLP4 8
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
GTF4 $187
LABELV $197
line 373
;369:			|| check->r.absmin[1] >= maxs[1]
;370:			|| check->r.absmin[2] >= maxs[2]
;371:			|| check->r.absmax[0] <= mins[0]
;372:			|| check->r.absmax[1] <= mins[1]
;373:			|| check->r.absmax[2] <= mins[2] ) {
line 374
;374:				continue;
ADDRGP4 $180
JUMPV
LABELV $187
line 378
;375:			}
;376:			// see if the ent's bbox is inside the pusher's final position
;377:			// this does allow a fast moving object to pass through a thin entity...
;378:			if (!G_TestEntityPosition (check)) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4216
ADDRGP4 G_TestEntityPosition
CALLP4
ASGNP4
ADDRLP4 4216
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $198
line 379
;379:				continue;
ADDRGP4 $180
JUMPV
LABELV $198
line 381
;380:			}
;381:		}
LABELV $185
line 384
;382:
;383:		// the entity needs to be pushed
;384:		if ( G_TryPushingEntity( check, pusher, move, amove ) ) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4212
ADDRGP4 G_TryPushingEntity
CALLI4
ASGNI4
ADDRLP4 4212
INDIRI4
CNSTI4 0
EQI4 $200
line 385
;385:			continue;
ADDRGP4 $180
JUMPV
LABELV $200
line 391
;386:		}
;387:
;388:		// the move was blocked an entity
;389:
;390:		// bobbing entities are instant-kill and never get blocked
;391:		if ( pusher->s.pos.trType == TR_SINE || pusher->s.apos.trType == TR_SINE ) {
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4220
CNSTI4 4
ASGNI4
ADDRLP4 4216
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4220
INDIRI4
EQI4 $204
ADDRLP4 4216
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 4220
INDIRI4
NEI4 $202
LABELV $204
line 392
;392:			G_Damage( check, pusher, pusher, NULL, NULL, 99999, 0, MOD_CRUSH );
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4224
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 4224
INDIRP4
ARGP4
ADDRLP4 4228
CNSTP4 0
ASGNP4
ADDRLP4 4228
INDIRP4
ARGP4
ADDRLP4 4228
INDIRP4
ARGP4
CNSTI4 99999
ARGI4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 393
;393:			continue;
ADDRGP4 $180
JUMPV
LABELV $202
line 398
;394:		}
;395:
;396:		
;397:		// save off the obstacle so we can call the block function (crush, etc)
;398:		*obstacle = check;
ADDRFP4 12
INDIRP4
ADDRLP4 8
INDIRP4
ASGNP4
line 403
;399:
;400:		// move back any entities we already moved
;401:		// go backwards, so if the same entity was pushed
;402:		// twice, it goes back to the original position
;403:		for ( p=pushed_p-1 ; p>=pushed ; p-- ) {
ADDRLP4 0
ADDRGP4 pushed_p
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
ADDRGP4 $208
JUMPV
LABELV $205
line 404
;404:			VectorCopy (p->origin, p->ent->s.pos.trBase);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 12
line 405
;405:			VectorCopy (p->angles, p->ent->s.apos.trBase);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRB
ASGNB 12
line 406
;406:			if ( p->ent->client ) {
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $209
line 407
;407:				p->ent->client->ps.delta_angles[YAW] = p->deltayaw;
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 408
;408:				VectorCopy (p->origin, p->ent->client->ps.origin);
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 12
line 409
;409:			}
LABELV $209
line 410
;410:			trap_LinkEntity (p->ent);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 411
;411:		}
LABELV $206
line 403
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -32
ADDP4
ASGNP4
LABELV $208
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 pushed
CVPU4 4
GEU4 $205
line 412
;412:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $157
JUMPV
LABELV $180
line 321
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $182
ADDRLP4 12
INDIRI4
ADDRLP4 4136
INDIRI4
LTI4 $179
line 415
;413:	}
;414:
;415:	return qtrue;
CNSTI4 1
RETI4
LABELV $157
endproc G_MoverPush 4240 32
export G_MoverTeam
proc G_MoverTeam 72 16
line 424
;416:}
;417:
;418:
;419:/*
;420:=================
;421:G_MoverTeam
;422:=================
;423:*/
;424:void G_MoverTeam( gentity_t *ent ) {
line 429
;425:	vec3_t		move, amove;
;426:	gentity_t	*part, *obstacle;
;427:	vec3_t		origin, angles;
;428:
;429:	obstacle = NULL;
ADDRLP4 52
CNSTP4 0
ASGNP4
line 434
;430:
;431:	// make sure all team slaves can move before commiting
;432:	// any moves or calling any think functions
;433:	// if the move is blocked, all moved objects will be backed out
;434:	pushed_p = pushed;
ADDRGP4 pushed_p
ADDRGP4 pushed
ASGNP4
line 435
;435:	for (part = ent ; part ; part=part->teamchain) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $215
JUMPV
LABELV $212
line 437
;436:		// get current position
;437:		BG_EvaluateTrajectory( &part->s.pos, level.time, origin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 438
;438:		BG_EvaluateTrajectory( &part->s.apos, level.time, angles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 439
;439:		VectorSubtract( origin, part->r.currentOrigin, move );
ADDRLP4 4
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 28+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 28+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
SUBF4
ASGNF4
line 440
;440:		VectorSubtract( angles, part->r.currentAngles, amove );
ADDRLP4 16
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 40+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRF4
SUBF4
ASGNF4
line 441
;441:		if ( !G_MoverPush( part, move, amove, &obstacle ) ) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 64
ADDRGP4 G_MoverPush
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
NEI4 $226
line 442
;442:			break;	// move was blocked
ADDRGP4 $214
JUMPV
LABELV $226
line 444
;443:		}
;444:	}
LABELV $213
line 435
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $215
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $212
LABELV $214
line 446
;445:
;446:	if (part) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $228
line 448
;447:		// go back to the previous position
;448:		for ( part = ent ; part ; part = part->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $233
JUMPV
LABELV $230
line 449
;449:			part->s.pos.trTime += level.time - level.previousTime;
ADDRLP4 56
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ADDI4
ASGNI4
line 450
;450:			part->s.apos.trTime += level.time - level.previousTime;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ADDI4
ASGNI4
line 451
;451:			BG_EvaluateTrajectory( &part->s.pos, level.time, part->r.currentOrigin );
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 452
;452:			BG_EvaluateTrajectory( &part->s.apos, level.time, part->r.currentAngles );
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 500
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 453
;453:			trap_LinkEntity( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 454
;454:		}
LABELV $231
line 448
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $233
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $230
line 457
;455:
;456:		// if the pusher has a "blocked" function, call it
;457:		if (ent->blocked) {
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $211
line 458
;458:			ent->blocked( ent, obstacle );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 700
ADDP4
INDIRP4
CALLV
pop
line 459
;459:		}
line 460
;460:		return;
ADDRGP4 $211
JUMPV
LABELV $228
line 464
;461:	}
;462:
;463:	// the move succeeded
;464:	for ( part = ent ; part ; part = part->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $245
JUMPV
LABELV $242
line 466
;465:		// call the reached function if time is at or past end point
;466:		if ( part->s.pos.trType == TR_LINEAR_STOP ) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $246
line 467
;467:			if ( level.time >= part->s.pos.trTime + part->s.pos.trDuration ) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ADDI4
LTI4 $248
line 468
;468:				if ( part->reached ) {
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
line 469
;469:					part->reached( part );
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
INDIRP4
CALLV
pop
line 470
;470:				}
LABELV $251
line 471
;471:			}
LABELV $248
line 472
;472:		}
LABELV $246
line 473
;473:	}
LABELV $243
line 464
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $245
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $242
line 474
;474:}
LABELV $211
endproc G_MoverTeam 72 16
export G_RunMover
proc G_RunMover 8 4
line 482
;475:
;476:/*
;477:================
;478:G_RunMover
;479:
;480:================
;481:*/
;482:void G_RunMover( gentity_t *ent ) {
line 485
;483:	// if not a team captain, don't do anything, because
;484:	// the captain will handle everything
;485:	if ( ent->flags & FL_TEAMSLAVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $254
line 486
;486:		return;
ADDRGP4 $253
JUMPV
LABELV $254
line 490
;487:	}
;488:
;489:	// if stationary at one of the positions, don't move anything
;490:	if ( ent->s.pos.trType != TR_STATIONARY || ent->s.apos.trType != TR_STATIONARY ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $258
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $256
LABELV $258
line 491
;491:		G_MoverTeam( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_MoverTeam
CALLV
pop
line 492
;492:	}
LABELV $256
line 495
;493:
;494:	// check think function
;495:	G_RunThink( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 496
;496:}
LABELV $253
endproc G_RunMover 8 4
export SetMoverState
proc SetMoverState 56 12
line 513
;497:
;498:/*
;499:============================================================================
;500:
;501:GENERAL MOVERS
;502:
;503:Doors, plats, and buttons are all binary (two position) movers
;504:Pos1 is "at rest", pos2 is "activated"
;505:============================================================================
;506:*/
;507:
;508:/*
;509:===============
;510:SetMoverState
;511:===============
;512:*/
;513:void SetMoverState( gentity_t *ent, moverState_t moverState, int time ) {
line 517
;514:	vec3_t			delta;
;515:	float			f;
;516:
;517:	ent->moverState = moverState;
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 519
;518:
;519:	ent->s.pos.trTime = time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 520
;520:	switch( moverState ) {
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $260
ADDRLP4 16
INDIRI4
CNSTI4 3
GTI4 $260
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $275
ADDP4
INDIRP4
JUMPV
lit
align 4
LABELV $275
address $263
address $264
address $265
address $270
code
LABELV $263
line 522
;521:	case MOVER_POS1:
;522:		VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 612
ADDP4
INDIRB
ASGNB 12
line 523
;523:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 524
;524:		break;
ADDRGP4 $261
JUMPV
LABELV $264
line 526
;525:	case MOVER_POS2:
;526:		VectorCopy( ent->pos2, ent->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 12
line 527
;527:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 528
;528:		break;
ADDRGP4 $261
JUMPV
LABELV $265
line 530
;529:	case MOVER_1TO2:
;530:		VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 612
ADDP4
INDIRB
ASGNB 12
line 531
;531:		VectorSubtract( ent->pos2, ent->pos1, delta );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
line 532
;532:		f = 1000.0 / ent->s.pos.trDuration;
ADDRLP4 12
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 533
;533:		VectorScale( delta, f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 534
;534:		ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 535
;535:		break;
ADDRGP4 $261
JUMPV
LABELV $270
line 537
;536:	case MOVER_2TO1:
;537:		VectorCopy( ent->pos2, ent->s.pos.trBase );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 12
line 538
;538:		VectorSubtract( ent->pos1, ent->pos2, delta );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 48
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 48
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 52
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
SUBF4
ASGNF4
line 539
;539:		f = 1000.0 / ent->s.pos.trDuration;
ADDRLP4 12
CNSTF4 1148846080
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 540
;540:		VectorScale( delta, f, ent->s.pos.trDelta );
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ASGNF4
line 541
;541:		ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 542
;542:		break;
LABELV $260
LABELV $261
line 544
;543:	}
;544:	BG_EvaluateTrajectory( &ent->s.pos, level.time, ent->r.currentOrigin );	
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 545
;545:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 546
;546:}
LABELV $259
endproc SetMoverState 56 12
export MatchTeam
proc MatchTeam 4 12
line 556
;547:
;548:/*
;549:================
;550:MatchTeam
;551:
;552:All entities in a mover team will move from pos1 to pos2
;553:in the same amount of time
;554:================
;555:*/
;556:void MatchTeam( gentity_t *teamLeader, int moverState, int time ) {
line 559
;557:	gentity_t		*slave;
;558:
;559:	for ( slave = teamLeader ; slave ; slave = slave->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $281
JUMPV
LABELV $278
line 560
;560:		SetMoverState( slave, (moverState_t)moverState, time ); // ***GREGS_VC9_PORT_MOD*** -- added typecast(s)
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 561
;561:	}
LABELV $279
line 559
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $281
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $278
line 562
;562:}
LABELV $277
endproc MatchTeam 4 12
export ReturnToPos1
proc ReturnToPos1 8 12
line 571
;563:
;564:
;565:
;566:/*
;567:================
;568:ReturnToPos1
;569:================
;570:*/
;571:void ReturnToPos1( gentity_t *ent ) {
line 572
;572:	MatchTeam( ent, MOVER_2TO1, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 575
;573:
;574:	// looping sound
;575:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 578
;576:
;577:	// starting sound
;578:	if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $284
line 579
;579:		G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 580
;580:	}
LABELV $284
line 581
;581:}
LABELV $282
endproc ReturnToPos1 8 12
export Reached_BinaryMover
proc Reached_BinaryMover 12 12
line 589
;582:
;583:
;584:/*
;585:================
;586:Reached_BinaryMover
;587:================
;588:*/
;589:void Reached_BinaryMover( gentity_t *ent ) {
line 592
;590:
;591:	// stop the looping sound
;592:	ent->s.loopSound = ent->soundLoop;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 594
;593:
;594:	if ( ent->moverState == MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 2
NEI4 $287
line 596
;595:		// reached pos2
;596:		SetMoverState( ent, MOVER_POS2, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 599
;597:
;598:		// play sound
;599:		if ( ent->soundPos2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $290
line 600
;600:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos2 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 592
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 601
;601:		}
LABELV $290
line 604
;602:
;603:		// return to pos1 after a delay
;604:		ent->think = ReturnToPos1;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 ReturnToPos1
ASGNP4
line 605
;605:		ent->nextthink = level.time + ent->wait;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 608
;606:
;607:		// fire targets
;608:		if ( !ent->activator ) {
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $293
line 609
;609:			ent->activator = ent;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 8
INDIRP4
ASGNP4
line 610
;610:		}
LABELV $293
line 611
;611:		G_UseTargets( ent, ent->activator );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 612
;612:	} else if ( ent->moverState == MOVER_2TO1 ) {
ADDRGP4 $288
JUMPV
LABELV $287
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 3
NEI4 $295
line 614
;613:		// reached pos1
;614:		SetMoverState( ent, MOVER_POS1, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 617
;615:
;616:		// play sound
;617:		if ( ent->soundPos1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
CNSTI4 0
EQI4 $298
line 618
;618:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->soundPos1 );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 580
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 619
;619:		}
LABELV $298
line 622
;620:
;621:		// close areaportals
;622:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
ADDRLP4 4
INDIRP4
CVPU4 4
EQU4 $302
ADDRLP4 8
INDIRU4
CNSTU4 0
NEU4 $296
LABELV $302
line 623
;623:			trap_AdjustAreaPortalState( ent, qfalse );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 624
;624:		}
line 625
;625:	} else {
ADDRGP4 $296
JUMPV
LABELV $295
line 626
;626:		G_Error( "Reached_BinaryMover: bad moverState" );
ADDRGP4 $303
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 627
;627:	}
LABELV $296
LABELV $288
line 628
;628:}
LABELV $286
endproc Reached_BinaryMover 12 12
export Use_BinaryMover
proc Use_BinaryMover 20 12
line 636
;629:
;630:
;631:/*
;632:================
;633:Use_BinaryMover
;634:================
;635:*/
;636:void Use_BinaryMover( gentity_t *ent, gentity_t *other, gentity_t *activator ) {
line 641
;637:	int		total;
;638:	int		partial;
;639:
;640:	// only the master should be used
;641:	if ( ent->flags & FL_TEAMSLAVE ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $305
line 642
;642:		Use_BinaryMover( ent->teammaster, other, activator );
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 643
;643:		return;
ADDRGP4 $304
JUMPV
LABELV $305
line 646
;644:	}
;645:
;646:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 648
;647:
;648:	if ( ent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $307
line 651
;649:		// start moving 50 msec later, becase if this was player
;650:		// triggered, level.time hasn't been advanced yet
;651:		MatchTeam( ent, MOVER_1TO2, level.time + 50 );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
ADDI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 654
;652:
;653:		// starting sound
;654:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $310
line 655
;655:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 656
;656:		}
LABELV $310
line 659
;657:
;658:		// looping sound
;659:		ent->s.loopSound = ent->soundLoop;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 662
;660:
;661:		// open areaportal
;662:		if ( ent->teammaster == ent || !ent->teammaster ) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
ADDRLP4 12
INDIRP4
CVPU4 4
EQU4 $314
ADDRLP4 16
INDIRU4
CNSTU4 0
NEU4 $304
LABELV $314
line 663
;663:			trap_AdjustAreaPortalState( ent, qtrue );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 trap_AdjustAreaPortalState
CALLV
pop
line 664
;664:		}
line 665
;665:		return;
ADDRGP4 $304
JUMPV
LABELV $307
line 669
;666:	}
;667:
;668:	// if all the way up, just delay before coming down
;669:	if ( ent->moverState == MOVER_POS2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 1
NEI4 $315
line 670
;670:		ent->nextthink = level.time + ent->wait;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDF4
CVFI4 4
ASGNI4
line 671
;671:		return;
ADDRGP4 $304
JUMPV
LABELV $315
line 675
;672:	}
;673:
;674:	// only partway down before reversing
;675:	if ( ent->moverState == MOVER_2TO1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 3
NEI4 $318
line 676
;676:		total = ent->s.pos.trDuration;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 677
;677:		partial = level.time - ent->s.pos.trTime;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 678
;678:		if ( partial > total ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $321
line 679
;679:			partial = total;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 680
;680:		}
LABELV $321
line 682
;681:
;682:		MatchTeam( ent, MOVER_1TO2, level.time - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 684
;683:
;684:		if ( ent->sound1to2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
CNSTI4 0
EQI4 $304
line 685
;685:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound1to2 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 584
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 686
;686:		}
line 687
;687:		return;
ADDRGP4 $304
JUMPV
LABELV $318
line 691
;688:	}
;689:
;690:	// only partway up before reversing
;691:	if ( ent->moverState == MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 2
NEI4 $326
line 692
;692:		total = ent->s.pos.trDuration;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 693
;693:		partial = level.time - ent->s.pos.trTime;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
SUBI4
ASGNI4
line 694
;694:		if ( partial > total ) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $329
line 695
;695:			partial = total;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 696
;696:		}
LABELV $329
line 698
;697:
;698:		MatchTeam( ent, MOVER_2TO1, level.time - ( total - partial ) );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
SUBI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 700
;699:
;700:		if ( ent->sound2to1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
CNSTI4 0
EQI4 $304
line 701
;701:			G_AddEvent( ent, EV_GENERAL_SOUND, ent->sound2to1 );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 588
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 702
;702:		}
line 703
;703:		return;
LABELV $326
line 705
;704:	}
;705:}
LABELV $304
endproc Use_BinaryMover 20 12
export InitMover
proc InitMover 100 12
line 717
;706:
;707:
;708:
;709:/*
;710:================
;711:InitMover
;712:
;713:"pos1", "pos2", and "speed" should be set before calling,
;714:so the movement delta can be calculated
;715:================
;716:*/
;717:void InitMover( gentity_t *ent ) {
line 727
;718:	vec3_t		move;
;719:	float		distance;
;720:	float		light;
;721:	vec3_t		color;
;722:	qboolean	lightSet, colorSet;
;723:	char		*sound;
;724:
;725:	// if the "model2" key is set, use a seperate model
;726:	// for drawing, but clip against the brushes
;727:	if ( ent->model2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $335
line 728
;728:		ent->s.modelindex2 = G_ModelIndex( ent->model2 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 544
ADDP4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 164
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 729
;729:	}
LABELV $335
line 732
;730:
;731:	// if the "loopsound" key is set, use a constant looping sound when moving
;732:	if ( G_SpawnString( "noise", "100", &sound ) ) {
ADDRGP4 $339
ARGP4
ADDRGP4 $340
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 44
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $337
line 733
;733:		ent->s.loopSound = G_SoundIndex( sound );
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 48
INDIRI4
ASGNI4
line 734
;734:	}
LABELV $337
line 737
;735:
;736:	// if the "color" or "light" keys are set, setup constantLight
;737:	lightSet = G_SpawnFloat( "light", "100", &light );
ADDRGP4 $341
ARGP4
ADDRGP4 $340
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 48
INDIRI4
ASGNI4
line 738
;738:	colorSet = G_SpawnVector( "color", "1 1 1", color );
ADDRGP4 $342
ARGP4
ADDRGP4 $343
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 52
ADDRGP4 G_SpawnVector
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 52
INDIRI4
ASGNI4
line 739
;739:	if ( lightSet || colorSet ) {
ADDRLP4 56
CNSTI4 0
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 56
INDIRI4
NEI4 $346
ADDRLP4 32
INDIRI4
ADDRLP4 56
INDIRI4
EQI4 $344
LABELV $346
line 742
;740:		int		r, g, b, i;
;741:
;742:		r = color[0] * 255;
ADDRLP4 60
CNSTF4 1132396544
ADDRLP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 743
;743:		if ( r > 255 ) {
ADDRLP4 60
INDIRI4
CNSTI4 255
LEI4 $347
line 744
;744:			r = 255;
ADDRLP4 60
CNSTI4 255
ASGNI4
line 745
;745:		}
LABELV $347
line 746
;746:		g = color[1] * 255;
ADDRLP4 64
CNSTF4 1132396544
ADDRLP4 12+4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 747
;747:		if ( g > 255 ) {
ADDRLP4 64
INDIRI4
CNSTI4 255
LEI4 $350
line 748
;748:			g = 255;
ADDRLP4 64
CNSTI4 255
ASGNI4
line 749
;749:		}
LABELV $350
line 750
;750:		b = color[2] * 255;
ADDRLP4 68
CNSTF4 1132396544
ADDRLP4 12+8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 751
;751:		if ( b > 255 ) {
ADDRLP4 68
INDIRI4
CNSTI4 255
LEI4 $353
line 752
;752:			b = 255;
ADDRLP4 68
CNSTI4 255
ASGNI4
line 753
;753:		}
LABELV $353
line 754
;754:		i = light / 4;
ADDRLP4 72
ADDRLP4 36
INDIRF4
CNSTF4 1082130432
DIVF4
CVFI4 4
ASGNI4
line 755
;755:		if ( i > 255 ) {
ADDRLP4 72
INDIRI4
CNSTI4 255
LEI4 $355
line 756
;756:			i = 255;
ADDRLP4 72
CNSTI4 255
ASGNI4
line 757
;757:		}
LABELV $355
line 758
;758:		ent->s.constantLight = r | ( g << 8 ) | ( b << 16 ) | ( i << 24 );
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 60
INDIRI4
ADDRLP4 64
INDIRI4
CNSTI4 8
LSHI4
BORI4
ADDRLP4 68
INDIRI4
CNSTI4 16
LSHI4
BORI4
ADDRLP4 72
INDIRI4
CNSTI4 24
LSHI4
BORI4
ASGNI4
line 759
;759:	}
LABELV $344
line 762
;760:
;761:
;762:	ent->use = Use_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_BinaryMover
ASGNP4
line 763
;763:	ent->reached = Reached_BinaryMover;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 Reached_BinaryMover
ASGNP4
line 765
;764:
;765:	ent->moverState = MOVER_POS1;
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
CNSTI4 0
ASGNI4
line 766
;766:	ent->r.svFlags = SVF_USE_CURRENT_ORIGIN;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 767
;767:	ent->s.eType = ET_MOVER;
ADDRLP4 60
CNSTI4 4
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 60
INDIRI4
ADDP4
ADDRLP4 60
INDIRI4
ASGNI4
line 768
;768:	VectorCopy (ent->pos1, ent->r.currentOrigin);
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 612
ADDP4
INDIRB
ASGNB 12
line 769
;769:	trap_LinkEntity (ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 771
;770:
;771:	ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 772
;772:	VectorCopy( ent->pos1, ent->s.pos.trBase );
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 612
ADDP4
INDIRB
ASGNB 12
line 775
;773:
;774:	// calculate time to reach second position from speed
;775:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 72
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 76
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
line 776
;776:	distance = VectorLength( move );
ADDRLP4 0
ARGP4
ADDRLP4 80
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 80
INDIRF4
ASGNF4
line 777
;777:	if ( ! ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $359
line 778
;778:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1120403456
ASGNF4
line 779
;779:	}
LABELV $359
line 780
;780:	VectorScale( move, ent->speed, ent->s.pos.trDelta );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
line 781
;781:	ent->s.pos.trDuration = distance * 1000 / ent->speed;
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 96
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 782
;782:	if ( ent->s.pos.trDuration <= 0 ) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
GTI4 $363
line 783
;783:		ent->s.pos.trDuration = 1;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 784
;784:	}
LABELV $363
line 785
;785:}
LABELV $334
endproc InitMover 100 12
export Blocked_Door
proc Blocked_Door 8 32
line 804
;786:
;787:
;788:/*
;789:===============================================================================
;790:
;791:DOOR
;792:
;793:A use can be triggered either by a touch function, by being shot, or by being
;794:targeted by another entity.
;795:
;796:===============================================================================
;797:*/
;798:
;799:/*
;800:================
;801:Blocked_Door
;802:================
;803:*/
;804:void Blocked_Door( gentity_t *ent, gentity_t *other ) {
line 806
;805:	// remove anything other than a client
;806:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $366
line 808
;807:		// except CTF flags!!!!
;808:		if( other->s.eType == ET_ITEM && other->item->giType == IT_TEAM ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $368
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $368
line 809
;809:			Team_DroppedFlagThink( other );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Team_DroppedFlagThink
CALLV
pop
line 810
;810:			return;
ADDRGP4 $365
JUMPV
LABELV $368
line 812
;811:		}
;812:		G_TempEntity( other->s.origin, EV_ITEM_POP );
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 41
ARGI4
ADDRGP4 G_TempEntity
CALLP4
pop
line 813
;813:		G_FreeEntity( other );
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 814
;814:		return;
ADDRGP4 $365
JUMPV
LABELV $366
line 817
;815:	}
;816:
;817:	if ( ent->damage ) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
EQI4 $370
line 818
;818:		G_Damage( other, ent, ent, NULL, NULL, ent->damage, 0, MOD_CRUSH );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
CNSTP4 0
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 819
;819:	}
LABELV $370
line 820
;820:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $372
line 821
;821:		return;		// crushers don't reverse
ADDRGP4 $365
JUMPV
LABELV $372
line 825
;822:	}
;823:
;824:	// reverse direction
;825:	Use_BinaryMover( ent, ent, other );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 826
;826:}
LABELV $365
endproc Blocked_Door 8 32
proc Touch_DoorTriggerSpectator 72 12
line 833
;827:
;828:/*
;829:================
;830:Touch_DoorTriggerSpectator
;831:================
;832:*/
;833:static void Touch_DoorTriggerSpectator( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 837
;834:	int i, axis;
;835:	vec3_t origin, dir, angles;
;836:
;837:	axis = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 838
;838:	VectorClear(dir);
ADDRLP4 44
CNSTF4 0
ASGNF4
ADDRLP4 20+8
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 20+4
ADDRLP4 44
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 839
;839:	if (fabs(other->s.origin[axis] - ent->r.absmax[axis]) <
ADDRLP4 48
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 48
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDP4
INDIRF4
ADDRLP4 48
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 52
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 56
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDP4
INDIRF4
ADDRLP4 56
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
GEF4 $377
line 840
;840:		fabs(other->s.origin[axis] - ent->r.absmin[axis])) {
line 841
;841:		origin[axis] = ent->r.absmin[axis] - 10;
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
CNSTF4 1092616192
SUBF4
ASGNF4
line 842
;842:		dir[axis] = -1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 3212836864
ASGNF4
line 843
;843:	}
ADDRGP4 $378
JUMPV
LABELV $377
line 844
;844:	else {
line 845
;845:		origin[axis] = ent->r.absmax[axis] + 10;
ADDRLP4 64
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
ADDRLP4 64
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 846
;846:		dir[axis] = 1;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
CNSTF4 1065353216
ASGNF4
line 847
;847:	}
LABELV $378
line 848
;848:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $379
line 849
;849:		if (i == axis) continue;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $383
ADDRGP4 $380
JUMPV
LABELV $383
line 850
;850:		origin[i] = (ent->r.absmin[i] + ent->r.absmax[i]) * 0.5;
ADDRLP4 64
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRI4
ADDRLP4 8
ADDP4
CNSTF4 1056964608
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
ADDRLP4 64
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
ADDF4
MULF4
ASGNF4
line 851
;851:	}
LABELV $380
line 848
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $379
line 852
;852:	vectoangles(dir, angles);
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 853
;853:	TeleportPlayer(other, origin, angles );
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 854
;854:}
LABELV $374
endproc Touch_DoorTriggerSpectator 72 12
export Touch_DoorTrigger
proc Touch_DoorTrigger 8 12
line 861
;855:
;856:/*
;857:================
;858:Touch_DoorTrigger
;859:================
;860:*/
;861:void Touch_DoorTrigger( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 862
;862:	if ( other->client && other->client->sess.sessionTeam == TEAM_SPECTATOR ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $386
ADDRLP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 3
NEI4 $386
line 864
;863:		// if the door is not open and not opening
;864:		if ( ent->parent->moverState != MOVER_1TO2 &&
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $387
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $387
line 865
;865:			ent->parent->moverState != MOVER_POS2) {
line 866
;866:			Touch_DoorTriggerSpectator( ent, other, trace );
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Touch_DoorTriggerSpectator
CALLV
pop
line 867
;867:		}
line 868
;868:	}
ADDRGP4 $387
JUMPV
LABELV $386
line 869
;869:	else if ( ent->parent->moverState != MOVER_1TO2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 2
EQI4 $390
line 870
;870:		Use_BinaryMover( ent->parent, ent, other );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 871
;871:	}
LABELV $390
LABELV $387
line 872
;872:}
LABELV $385
endproc Touch_DoorTrigger 8 12
export Think_SpawnNewDoorTrigger
proc Think_SpawnNewDoorTrigger 52 12
line 883
;873:
;874:
;875:/*
;876:======================
;877:Think_SpawnNewDoorTrigger
;878:
;879:All of the parts of a door have been spawned, so create
;880:a trigger that encloses all of them
;881:======================
;882:*/
;883:void Think_SpawnNewDoorTrigger( gentity_t *ent ) {
line 889
;884:	gentity_t		*other;
;885:	vec3_t		mins, maxs;
;886:	int			i, best;
;887:
;888:	// set all of the slaves as shootable
;889:	for ( other = ent ; other ; other = other->teamchain ) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $396
JUMPV
LABELV $393
line 890
;890:		other->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 891
;891:	}
LABELV $394
line 889
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $396
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $393
line 894
;892:
;893:	// find the bounds of everything on the team
;894:	VectorCopy (ent->r.absmin, mins);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 895
;895:	VectorCopy (ent->r.absmax, maxs);
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 897
;896:
;897:	for (other = ent->teamchain ; other ; other=other->teamchain) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $400
JUMPV
LABELV $397
line 898
;898:		AddPointToBounds (other->r.absmin, mins, maxs);
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 AddPointToBounds
CALLV
pop
line 899
;899:		AddPointToBounds (other->r.absmax, mins, maxs);
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 AddPointToBounds
CALLV
pop
line 900
;900:	}
LABELV $398
line 897
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
LABELV $400
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $397
line 903
;901:
;902:	// find the thinnest axis, which will be the one we expand
;903:	best = 0;
ADDRLP4 32
CNSTI4 0
ASGNI4
line 904
;904:	for ( i = 1 ; i < 3 ; i++ ) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $401
line 905
;905:		if ( maxs[i] - mins[i] < maxs[best] - mins[best] ) {
ADDRLP4 36
CNSTI4 2
ASGNI4
ADDRLP4 40
ADDRLP4 4
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 44
ADDRLP4 32
INDIRI4
ADDRLP4 36
INDIRI4
LSHI4
ASGNI4
ADDRLP4 40
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
ADDRLP4 44
INDIRI4
ADDRLP4 20
ADDP4
INDIRF4
ADDRLP4 44
INDIRI4
ADDRLP4 8
ADDP4
INDIRF4
SUBF4
GEF4 $405
line 906
;906:			best = i;
ADDRLP4 32
ADDRLP4 4
INDIRI4
ASGNI4
line 907
;907:		}
LABELV $405
line 908
;908:	}
LABELV $402
line 904
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $401
line 909
;909:	maxs[best] += 120;
ADDRLP4 36
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 910
;910:	mins[best] -= 120;
ADDRLP4 40
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
CNSTF4 1123024896
SUBF4
ASGNF4
line 913
;911:
;912:	// create a trigger with this size
;913:	other = G_Spawn ();
ADDRLP4 44
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 44
INDIRP4
ASGNP4
line 914
;914:	other->classname = "door_trigger";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $407
ASGNP4
line 915
;915:	VectorCopy (mins, other->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 8
INDIRB
ASGNB 12
line 916
;916:	VectorCopy (maxs, other->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 20
INDIRB
ASGNB 12
line 917
;917:	other->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 918
;918:	other->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 919
;919:	other->touch = Touch_DoorTrigger;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_DoorTrigger
ASGNP4
line 921
;920:	// remember the thinnest axis
;921:	other->count = best;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 922
;922:	trap_LinkEntity (other);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 924
;923:
;924:	MatchTeam( ent, ent->moverState, level.time );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 925
;925:}
LABELV $392
endproc Think_SpawnNewDoorTrigger 52 12
export Think_MatchTeam
proc Think_MatchTeam 4 12
line 927
;926:
;927:void Think_MatchTeam( gentity_t *ent ) {
line 928
;928:	MatchTeam( ent, ent->moverState, level.time );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 MatchTeam
CALLV
pop
line 929
;929:}
LABELV $409
endproc Think_MatchTeam 4 12
export SP_func_door
proc SP_func_door 112 12
line 948
;930:
;931:
;932:/*QUAKED func_door (0 .5 .8) ? START_OPEN x CRUSHER
;933:TOGGLE		wait in both the start and end states for a trigger event.
;934:START_OPEN	the door to moves to its destination when spawned, and operate in reverse.  It is used to temporarily or permanently close off an area when triggered (not useful for touch or takedamage doors).
;935:NOMONSTER	monsters will not trigger this door
;936:
;937:"model2"	.md3 model to also draw
;938:"angle"		determines the opening direction
;939:"targetname" if set, no touch field will be spawned and a remote button or trigger field activates the door.
;940:"speed"		movement speed (100 default)
;941:"wait"		wait before returning (3 default, -1 = never return)
;942:"lip"		lip remaining at end of move (8 default)
;943:"dmg"		damage to inflict when blocked (2 default)
;944:"color"		constantLight color
;945:"light"		constantLight radius
;946:"health"	if set, the door must be shot open
;947:*/
;948:void SP_func_door (gentity_t *ent) {
line 954
;949:	vec3_t	abs_movedir;
;950:	float	distance;
;951:	vec3_t	size;
;952:	float	lip;
;953:
;954:	ent->sound1to2 = ent->sound2to1 = G_SoundIndex("sound/movers/doors/dr1_strt.wav");
ADDRGP4 $412
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
ADDRLP4 36
INDIRP4
CNSTI4 584
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 955
;955:	ent->soundPos1 = ent->soundPos2 = G_SoundIndex("sound/movers/doors/dr1_end.wav");
ADDRGP4 $413
ARGP4
ADDRLP4 40
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 592
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
ADDRLP4 44
INDIRP4
CNSTI4 580
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 957
;956:
;957:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 960
;958:
;959:	// default speed of 400
;960:	if (!ent->speed)
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $414
line 961
;961:		ent->speed = 400;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1137180672
ASGNF4
LABELV $414
line 964
;962:
;963:	// default wait of 2 seconds
;964:	if (!ent->wait)
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
NEF4 $416
line 965
;965:		ent->wait = 2;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1073741824
ASGNF4
LABELV $416
line 966
;966:	ent->wait *= 1000;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTF4 1148846080
ADDRLP4 48
INDIRP4
INDIRF4
MULF4
ASGNF4
line 969
;967:
;968:	// default lip of 8 units
;969:	G_SpawnFloat( "lip", "8", &lip );
ADDRGP4 $418
ARGP4
ADDRGP4 $419
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 972
;970:
;971:	// default damage of 2 points
;972:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $420
ARGP4
ADDRGP4 $421
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 975
;973:
;974:	// first position at start
;975:	VectorCopy( ent->s.origin, ent->pos1 );
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 52
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 978
;976:
;977:	// calculate second position
;978:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 979
;979:	G_SetMovedir (ent->s.angles, ent->movedir);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 980
;980:	abs_movedir[0] = fabs(ent->movedir[0]);
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
ARGF4
ADDRLP4 64
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 64
INDIRF4
ASGNF4
line 981
;981:	abs_movedir[1] = fabs(ent->movedir[1]);
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 68
INDIRF4
ASGNF4
line 982
;982:	abs_movedir[2] = fabs(ent->movedir[2]);
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ARGF4
ADDRLP4 72
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 72
INDIRF4
ASGNF4
line 983
;983:	VectorSubtract( ent->r.maxs, ent->r.mins, size );
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 76
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 76
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 80
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
SUBF4
ASGNF4
line 984
;984:	distance = DotProduct( abs_movedir, size ) - lip;
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
line 985
;985:	VectorMA( ent->pos1, distance, ent->movedir, ent->pos2 );
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 988
;986:
;987:	// if "start_open", reverse position 1 and 2
;988:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $430
line 991
;989:		vec3_t	temp;
;990:
;991:		VectorCopy( ent->pos2, temp );
ADDRLP4 96
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 12
line 992
;992:		VectorCopy( ent->s.origin, ent->pos2 );
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 993
;993:		VectorCopy( temp, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 96
INDIRB
ASGNB 12
line 994
;994:	}
LABELV $430
line 996
;995:
;996:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 998
;997:
;998:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1000
;999:
;1000:	if ( ! (ent->flags & FL_TEAMSLAVE ) ) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $433
line 1003
;1001:		int health;
;1002:
;1003:		G_SpawnInt( "health", "0", &health );
ADDRGP4 $435
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1004
;1004:		if ( health ) {
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $437
line 1005
;1005:			ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 1006
;1006:		}
LABELV $437
line 1007
;1007:		if ( ent->targetname || health ) {
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $441
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $439
LABELV $441
line 1009
;1008:			// non touch/shoot doors
;1009:			ent->think = Think_MatchTeam;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_MatchTeam
ASGNP4
line 1010
;1010:		} else {
ADDRGP4 $440
JUMPV
LABELV $439
line 1011
;1011:			ent->think = Think_SpawnNewDoorTrigger;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_SpawnNewDoorTrigger
ASGNP4
line 1012
;1012:		}
LABELV $440
line 1013
;1013:	}
LABELV $433
line 1016
;1014:
;1015:
;1016:}
LABELV $411
endproc SP_func_door 112 12
export Touch_Plat
proc Touch_Plat 4 0
line 1033
;1017:
;1018:/*
;1019:===============================================================================
;1020:
;1021:PLAT
;1022:
;1023:===============================================================================
;1024:*/
;1025:
;1026:/*
;1027:==============
;1028:Touch_Plat
;1029:
;1030:Don't allow decent if a living player is on it
;1031:===============
;1032:*/
;1033:void Touch_Plat( gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1034
;1034:	if ( !other->client || other->client->ps.stats[STAT_HEALTH] <= 0 ) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $445
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $443
LABELV $445
line 1035
;1035:		return;
ADDRGP4 $442
JUMPV
LABELV $443
line 1039
;1036:	}
;1037:
;1038:	// delay return-to-pos1 by one second
;1039:	if ( ent->moverState == MOVER_POS2 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 1
NEI4 $446
line 1040
;1040:		ent->nextthink = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 1041
;1041:	}
LABELV $446
line 1042
;1042:}
LABELV $442
endproc Touch_Plat 4 0
export Touch_PlatCenterTrigger
proc Touch_PlatCenterTrigger 4 12
line 1051
;1043:
;1044:/*
;1045:==============
;1046:Touch_PlatCenterTrigger
;1047:
;1048:If the plat is at the bottom position, start it going up
;1049:===============
;1050:*/
;1051:void Touch_PlatCenterTrigger(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1052
;1052:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $450
line 1053
;1053:		return;
ADDRGP4 $449
JUMPV
LABELV $450
line 1056
;1054:	}
;1055:
;1056:	if ( ent->parent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $452
line 1057
;1057:		Use_BinaryMover( ent->parent, ent, other );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1058
;1058:	}
LABELV $452
line 1059
;1059:}
LABELV $449
endproc Touch_PlatCenterTrigger 4 12
export SpawnPlatTrigger
proc SpawnPlatTrigger 60 4
line 1071
;1060:
;1061:
;1062:/*
;1063:================
;1064:SpawnPlatTrigger
;1065:
;1066:Spawn a trigger in the middle of the plat's low position
;1067:Elevator cars require that the trigger extend through the entire low position,
;1068:not just sit on top of it.
;1069:================
;1070:*/
;1071:void SpawnPlatTrigger( gentity_t *ent ) {
line 1077
;1072:	gentity_t	*trigger;
;1073:	vec3_t	tmin, tmax;
;1074:
;1075:	// the middle trigger will be a thin trigger just
;1076:	// above the starting position
;1077:	trigger = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 1078
;1078:	trigger->classname = "plat_trigger";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $455
ASGNP4
line 1079
;1079:	trigger->touch = Touch_PlatCenterTrigger;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_PlatCenterTrigger
ASGNP4
line 1080
;1080:	trigger->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 1081
;1081:	trigger->parent = ent;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 1083
;1082:	
;1083:	tmin[0] = ent->pos1[0] + ent->r.mins[0] + 33;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
ADDF4
ASGNF4
line 1084
;1084:	tmin[1] = ent->pos1[1] + ent->r.mins[1] + 33;
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 36
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
ADDF4
ASGNF4
line 1085
;1085:	tmin[2] = ent->pos1[2] + ent->r.mins[2];
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 40
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1087
;1086:
;1087:	tmax[0] = ent->pos1[0] + ent->r.maxs[0] - 33;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 44
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 44
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
SUBF4
ASGNF4
line 1088
;1088:	tmax[1] = ent->pos1[1] + ent->r.maxs[1] - 33;
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16+4
ADDRLP4 48
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 48
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
CNSTF4 1107558400
SUBF4
ASGNF4
line 1089
;1089:	tmax[2] = ent->pos1[2] + ent->r.maxs[2] + 8;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16+8
ADDRLP4 52
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1091
;1090:
;1091:	if ( tmax[0] <= tmin[0] ) {
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
GTF4 $460
line 1092
;1092:		tmin[0] = ent->pos1[0] + (ent->r.mins[0] + ent->r.maxs[0]) *0.5;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 56
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 56
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1093
;1093:		tmax[0] = tmin[0] + 1;
ADDRLP4 16
ADDRLP4 4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1094
;1094:	}
LABELV $460
line 1095
;1095:	if ( tmax[1] <= tmin[1] ) {
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
GTF4 $462
line 1096
;1096:		tmin[1] = ent->pos1[1] + (ent->r.mins[1] + ent->r.maxs[1]) *0.5;
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+4
ADDRLP4 56
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
CNSTF4 1056964608
ADDRLP4 56
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDRLP4 56
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
MULF4
ADDF4
ASGNF4
line 1097
;1097:		tmax[1] = tmin[1] + 1;
ADDRLP4 16+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1098
;1098:	}
LABELV $462
line 1100
;1099:	
;1100:	VectorCopy (tmin, trigger->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 1101
;1101:	VectorCopy (tmax, trigger->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 1103
;1102:
;1103:	trap_LinkEntity (trigger);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1104
;1104:}
LABELV $454
endproc SpawnPlatTrigger 60 4
export SP_func_plat
proc SP_func_plat 56 12
line 1118
;1105:
;1106:
;1107:/*QUAKED func_plat (0 .5 .8) ?
;1108:Plats are always drawn in the extended position so they will light correctly.
;1109:
;1110:"lip"		default 8, protrusion above rest position
;1111:"height"	total height of movement, defaults to model height
;1112:"speed"		overrides default 200.
;1113:"dmg"		overrides default 2
;1114:"model2"	.md3 model to also draw
;1115:"color"		constantLight color
;1116:"light"		constantLight radius
;1117:*/
;1118:void SP_func_plat (gentity_t *ent) {
line 1121
;1119:	float		lip, height;
;1120:
;1121:	ent->sound1to2 = ent->sound2to1 = G_SoundIndex("sound/movers/plats/pt1_strt.wav");
ADDRGP4 $470
ARGP4
ADDRLP4 8
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 588
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 584
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1122
;1122:	ent->soundPos1 = ent->soundPos2 = G_SoundIndex("sound/movers/plats/pt1_end.wav");
ADDRGP4 $471
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 592
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 20
INDIRP4
CNSTI4 580
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1124
;1123:
;1124:	VectorClear (ent->s.angles);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 24
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 28
INDIRF4
ASGNF4
line 1126
;1125:
;1126:	G_SpawnFloat( "speed", "200", &ent->speed );
ADDRGP4 $472
ARGP4
ADDRGP4 $473
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1127
;1127:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $420
ARGP4
ADDRGP4 $421
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1128
;1128:	G_SpawnFloat( "wait", "1", &ent->wait );
ADDRGP4 $474
ARGP4
ADDRGP4 $475
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1129
;1129:	G_SpawnFloat( "lip", "8", &lip );
ADDRGP4 $418
ARGP4
ADDRGP4 $419
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1131
;1130:
;1131:	ent->wait = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1148846080
ASGNF4
line 1134
;1132:
;1133:	// create second position
;1134:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1136
;1135:
;1136:	if ( !G_SpawnFloat( "height", "0", &height ) ) {
ADDRGP4 $478
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 G_SpawnFloat
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $476
line 1137
;1137:		height = (ent->r.maxs[2] - ent->r.mins[2]) - lip;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
SUBF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 1138
;1138:	}
LABELV $476
line 1141
;1139:
;1140:	// pos1 is the rest (bottom) position, pos2 is the top
;1141:	VectorCopy( ent->s.origin, ent->pos2 );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1142
;1142:	VectorCopy( ent->pos2, ent->pos1 );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 12
line 1143
;1143:	ent->pos1[2] -= height;
ADDRLP4 48
ADDRFP4 0
INDIRP4
CNSTI4 620
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
line 1145
;1144:
;1145:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1149
;1146:
;1147:	// touch function keeps the plat from returning while
;1148:	// a live player is standing on it
;1149:	ent->touch = Touch_Plat;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Plat
ASGNP4
line 1151
;1150:
;1151:	ent->blocked = Blocked_Door;
ADDRFP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRGP4 Blocked_Door
ASGNP4
line 1153
;1152:
;1153:	ent->parent = ent;	// so it can be treated as a door
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 600
ADDP4
ADDRLP4 52
INDIRP4
ASGNP4
line 1156
;1154:
;1155:	// spawn the trigger if one hasn't been custom made
;1156:	if ( !ent->targetname ) {
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $479
line 1157
;1157:		SpawnPlatTrigger(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpawnPlatTrigger
CALLV
pop
line 1158
;1158:	}
LABELV $479
line 1159
;1159:}
LABELV $469
endproc SP_func_plat 56 12
export Touch_Button
proc Touch_Button 4 12
line 1176
;1160:
;1161:
;1162:/*
;1163:===============================================================================
;1164:
;1165:BUTTON
;1166:
;1167:===============================================================================
;1168:*/
;1169:
;1170:/*
;1171:==============
;1172:Touch_Button
;1173:
;1174:===============
;1175:*/
;1176:void Touch_Button(gentity_t *ent, gentity_t *other, trace_t *trace ) {
line 1177
;1177:	if ( !other->client ) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $482
line 1178
;1178:		return;
ADDRGP4 $481
JUMPV
LABELV $482
line 1181
;1179:	}
;1180:
;1181:	if ( ent->moverState == MOVER_POS1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $484
line 1182
;1182:		Use_BinaryMover( ent, other, other );
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Use_BinaryMover
CALLV
pop
line 1183
;1183:	}
LABELV $484
line 1184
;1184:}
LABELV $481
endproc Touch_Button 4 12
export SP_func_button
proc SP_func_button 84 12
line 1200
;1185:
;1186:
;1187:/*QUAKED func_button (0 .5 .8) ?
;1188:When a button is touched, it moves some distance in the direction of it's angle, triggers all of it's targets, waits some time, then returns to it's original position where it can be triggered again.
;1189:
;1190:"model2"	.md3 model to also draw
;1191:"angle"		determines the opening direction
;1192:"target"	all entities with a matching targetname will be used
;1193:"speed"		override the default 40 speed
;1194:"wait"		override the default 1 second wait (-1 = never return)
;1195:"lip"		override the default 4 pixel lip remaining at end of move
;1196:"health"	if set, the button must be killed instead of touched
;1197:"color"		constantLight color
;1198:"light"		constantLight radius
;1199:*/
;1200:void SP_func_button( gentity_t *ent ) {
line 1206
;1201:	vec3_t		abs_movedir;
;1202:	float		distance;
;1203:	vec3_t		size;
;1204:	float		lip;
;1205:
;1206:	ent->sound1to2 = G_SoundIndex("sound/movers/switches/butn2.wav");
ADDRGP4 $487
ARGP4
ADDRLP4 32
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 584
ADDP4
ADDRLP4 32
INDIRI4
ASGNI4
line 1208
;1207:	
;1208:	if ( !ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $488
line 1209
;1209:		ent->speed = 40;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1109393408
ASGNF4
line 1210
;1210:	}
LABELV $488
line 1212
;1211:
;1212:	if ( !ent->wait ) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
NEF4 $490
line 1213
;1213:		ent->wait = 1;
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1065353216
ASGNF4
line 1214
;1214:	}
LABELV $490
line 1215
;1215:	ent->wait *= 1000;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTF4 1148846080
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ASGNF4
line 1218
;1216:
;1217:	// first position
;1218:	VectorCopy( ent->s.origin, ent->pos1 );
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1221
;1219:
;1220:	// calculate second position
;1221:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1223
;1222:
;1223:	G_SpawnFloat( "lip", "4", &lip );
ADDRGP4 $418
ARGP4
ADDRGP4 $492
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1225
;1224:
;1225:	G_SetMovedir( ent->s.angles, ent->movedir );
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 48
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 1226
;1226:	abs_movedir[0] = fabs(ent->movedir[0]);
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 52
INDIRF4
ASGNF4
line 1227
;1227:	abs_movedir[1] = fabs(ent->movedir[1]);
ADDRFP4 0
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 56
INDIRF4
ASGNF4
line 1228
;1228:	abs_movedir[2] = fabs(ent->movedir[2]);
ADDRFP4 0
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 60
INDIRF4
ASGNF4
line 1229
;1229:	VectorSubtract( ent->r.maxs, ent->r.mins, size );
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 64
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 64
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDRLP4 64
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12+8
ADDRLP4 68
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDRLP4 68
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1230
;1230:	distance = abs_movedir[0] * size[0] + abs_movedir[1] * size[1] + abs_movedir[2] * size[2] - lip;
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
line 1231
;1231:	VectorMA (ent->pos1, distance, ent->movedir, ent->pos2);
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
ADDRLP4 72
INDIRP4
CNSTI4 676
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 628
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
ADDRLP4 76
INDIRP4
CNSTI4 680
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 684
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDF4
ASGNF4
line 1233
;1232:
;1233:	if (ent->health) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
EQI4 $501
line 1235
;1234:		// shootable button
;1235:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 1236
;1236:	} else {
ADDRGP4 $502
JUMPV
LABELV $501
line 1238
;1237:		// touchable button
;1238:		ent->touch = Touch_Button;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Button
ASGNP4
line 1239
;1239:	}
LABELV $502
line 1241
;1240:
;1241:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1242
;1242:}
LABELV $486
endproc SP_func_button 84 12
export Think_BeginMoving
proc Think_BeginMoving 0 0
line 1266
;1243:
;1244:
;1245:
;1246:/*
;1247:===============================================================================
;1248:
;1249:TRAIN
;1250:
;1251:===============================================================================
;1252:*/
;1253:
;1254:
;1255:#define TRAIN_START_ON		1
;1256:#define TRAIN_TOGGLE		2
;1257:#define TRAIN_BLOCK_STOPS	4
;1258:
;1259:/*
;1260:===============
;1261:Think_BeginMoving
;1262:
;1263:The wait time at a corner has completed, so start moving again
;1264:===============
;1265:*/
;1266:void Think_BeginMoving( gentity_t *ent ) {
line 1267
;1267:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1268
;1268:	ent->s.pos.trType = TR_LINEAR_STOP;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 3
ASGNI4
line 1269
;1269:}
LABELV $503
endproc Think_BeginMoving 0 0
export Reached_Train
proc Reached_Train 48 12
line 1276
;1270:
;1271:/*
;1272:===============
;1273:Reached_Train
;1274:===============
;1275:*/
;1276:void Reached_Train( gentity_t *ent ) {
line 1283
;1277:	gentity_t		*next;
;1278:	float			speed;
;1279:	vec3_t			move;
;1280:	float			length;
;1281:
;1282:	// copy the apropriate values
;1283:	next = ent->nextTrain;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
ASGNP4
line 1284
;1284:	if ( !next || !next->nextTrain ) {
ADDRLP4 28
CNSTU4 0
ASGNU4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
EQU4 $508
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRU4
NEU4 $506
LABELV $508
line 1285
;1285:		return;		// just stop
ADDRGP4 $505
JUMPV
LABELV $506
line 1289
;1286:	}
;1287:
;1288:	// fire all other targets
;1289:	G_UseTargets( next, NULL );
ADDRLP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1292
;1290:
;1291:	// set the new trajectory
;1292:	ent->nextTrain = next->nextTrain;
ADDRLP4 32
CNSTI4 604
ASGNI4
ADDRFP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
ADDRLP4 0
INDIRP4
ADDRLP4 32
INDIRI4
ADDP4
INDIRP4
ASGNP4
line 1293
;1293:	VectorCopy( next->s.origin, ent->pos1 );
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1294
;1294:	VectorCopy( next->nextTrain->s.origin, ent->pos2 );
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1297
;1295:
;1296:	// if the path_corner has a speed, use that
;1297:	if ( next->speed ) {
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
EQF4 $509
line 1298
;1298:		speed = next->speed;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
ASGNF4
line 1299
;1299:	} else {
ADDRGP4 $510
JUMPV
LABELV $509
line 1301
;1300:		// otherwise use the train's speed
;1301:		speed = ent->speed;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
ASGNF4
line 1302
;1302:	}
LABELV $510
line 1303
;1303:	if ( speed < 1 ) {
ADDRLP4 16
INDIRF4
CNSTF4 1065353216
GEF4 $511
line 1304
;1304:		speed = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1305
;1305:	}
LABELV $511
line 1308
;1306:
;1307:	// calculate duration
;1308:	VectorSubtract( ent->pos2, ent->pos1, move );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 36
INDIRP4
CNSTI4 624
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 612
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 36
INDIRP4
CNSTI4 628
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 616
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4+8
ADDRLP4 40
INDIRP4
CNSTI4 632
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 620
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1309
;1309:	length = VectorLength( move );
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
ASGNF4
line 1311
;1310:
;1311:	ent->s.pos.trDuration = length * 1000 / speed;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 20
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1314
;1312:
;1313:	// looping sound
;1314:	ent->s.loopSound = next->soundLoop;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 596
ADDP4
INDIRI4
ASGNI4
line 1317
;1315:
;1316:	// start it going
;1317:	SetMoverState( ent, MOVER_1TO2, level.time );
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRGP4 SetMoverState
CALLV
pop
line 1320
;1318:
;1319:	// if there is a "wait" value on the target, don't start moving yet
;1320:	if ( next->wait ) {
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $516
line 1321
;1321:		ent->nextthink = level.time + next->wait * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 1148846080
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1322
;1322:		ent->think = Think_BeginMoving;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_BeginMoving
ASGNP4
line 1323
;1323:		ent->s.pos.trType = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 1324
;1324:	}
LABELV $516
line 1325
;1325:}
LABELV $505
endproc Reached_Train 48 12
export Think_SetupTrainTargets
proc Think_SetupTrainTargets 28 12
line 1335
;1326:
;1327:
;1328:/*
;1329:===============
;1330:Think_SetupTrainTargets
;1331:
;1332:Link all the corners together
;1333:===============
;1334:*/
;1335:void Think_SetupTrainTargets( gentity_t *ent ) {
line 1338
;1336:	gentity_t		*path, *next, *start;
;1337:
;1338:	ent->nextTrain = G_Find( NULL, FOFS(targetname), ent->target );
CNSTP4 0
ARGP4
CNSTI4 652
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 604
ADDP4
ADDRLP4 16
INDIRP4
ASGNP4
line 1339
;1339:	if ( !ent->nextTrain ) {
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $520
line 1340
;1340:		G_Printf( "func_train at %s with an unfound target\n",
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $522
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1342
;1341:			vtos(ent->r.absmin) );
;1342:		return;
ADDRGP4 $519
JUMPV
LABELV $520
line 1345
;1343:	}
;1344:
;1345:	start = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 1346
;1346:	for ( path = ent->nextTrain ; path != start ; path = next ) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $526
JUMPV
LABELV $523
line 1347
;1347:		if ( !start ) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $527
line 1348
;1348:			start = path;
ADDRLP4 8
ADDRLP4 4
INDIRP4
ASGNP4
line 1349
;1349:		}
LABELV $527
line 1351
;1350:
;1351:		if ( !path->target ) {
ADDRLP4 4
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $529
line 1352
;1352:			G_Printf( "Train corner at %s without a target\n",
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $531
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1354
;1353:				vtos(path->s.origin) );
;1354:			return;
ADDRGP4 $519
JUMPV
LABELV $529
line 1360
;1355:		}
;1356:
;1357:		// find a path_corner among the targets
;1358:		// there may also be other targets that get fired when the corner
;1359:		// is reached
;1360:		next = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $532
line 1361
;1361:		do {
line 1362
;1362:			next = G_Find( next, FOFS(targetname), path->target );
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 652
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 1363
;1363:			if ( !next ) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $535
line 1364
;1364:				G_Printf( "Train corner at %s without a target path_corner\n",
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $537
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1366
;1365:					vtos(path->s.origin) );
;1366:				return;
ADDRGP4 $519
JUMPV
LABELV $535
line 1368
;1367:			}
;1368:		} while ( strcmp( next->classname, "path_corner" ) );
LABELV $533
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 20
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $532
line 1370
;1369:
;1370:		path->nextTrain = next;
ADDRLP4 4
INDIRP4
CNSTI4 604
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1371
;1371:	}
LABELV $524
line 1346
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $526
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
NEU4 $523
line 1374
;1372:
;1373:	// start the train moving from the first corner
;1374:	Reached_Train( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Reached_Train
CALLV
pop
line 1375
;1375:}
LABELV $519
endproc Think_SetupTrainTargets 28 12
export SP_path_corner
proc SP_path_corner 4 8
line 1385
;1376:
;1377:
;1378:
;1379:/*QUAKED path_corner (.5 .3 0) (-8 -8 -8) (8 8 8)
;1380:Train path corners.
;1381:Target: next path corner and other targets to fire
;1382:"speed" speed to move to the next corner
;1383:"wait" seconds to wait before behining move to next corner
;1384:*/
;1385:void SP_path_corner( gentity_t *self ) {
line 1386
;1386:	if ( !self->targetname ) {
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $540
line 1387
;1387:		G_Printf ("path_corner with no targetname at %s\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $542
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1388
;1388:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1389
;1389:		return;
LABELV $540
line 1392
;1390:	}
;1391:	// path corners don't need to be linked in
;1392:}
LABELV $539
endproc SP_path_corner 4 8
export SP_func_train
proc SP_func_train 12 8
line 1408
;1393:
;1394:
;1395:
;1396:/*QUAKED func_train (0 .5 .8) ? START_ON TOGGLE BLOCK_STOPS
;1397:A train is a mover that moves between path_corner target points.
;1398:Trains MUST HAVE AN ORIGIN BRUSH.
;1399:The train spawns at the first target it is pointing at.
;1400:"model2"	.md3 model to also draw
;1401:"speed"		default 100
;1402:"dmg"		default	2
;1403:"noise"		looping sound to play when the train is in motion
;1404:"target"	next path corner
;1405:"color"		constantLight color
;1406:"light"		constantLight radius
;1407:*/
;1408:void SP_func_train (gentity_t *self) {
line 1409
;1409:	VectorClear (self->s.angles);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 124
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 4
INDIRF4
ASGNF4
line 1411
;1410:
;1411:	if (self->spawnflags & TRAIN_BLOCK_STOPS) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $544
line 1412
;1412:		self->damage = 0;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 0
ASGNI4
line 1413
;1413:	} else {
ADDRGP4 $545
JUMPV
LABELV $544
line 1414
;1414:		if (!self->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $546
line 1415
;1415:			self->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 2
ASGNI4
line 1416
;1416:		}
LABELV $546
line 1417
;1417:	}
LABELV $545
line 1419
;1418:
;1419:	if ( !self->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $548
line 1420
;1420:		self->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1120403456
ASGNF4
line 1421
;1421:	}
LABELV $548
line 1423
;1422:
;1423:	if ( !self->target ) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $550
line 1424
;1424:		G_Printf ("func_train without a target at %s\n", vtos(self->r.absmin));
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $552
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1425
;1425:		G_FreeEntity( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1426
;1426:		return;
ADDRGP4 $543
JUMPV
LABELV $550
line 1429
;1427:	}
;1428:
;1429:	trap_SetBrushModel( self, self->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1430
;1430:	InitMover( self );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1432
;1431:
;1432:	self->reached = Reached_Train;
ADDRFP4 0
INDIRP4
CNSTI4 696
ADDP4
ADDRGP4 Reached_Train
ASGNP4
line 1436
;1433:
;1434:	// start trains on the second frame, to make sure their targets have had
;1435:	// a chance to spawn
;1436:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1437
;1437:	self->think = Think_SetupTrainTargets;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Think_SetupTrainTargets
ASGNP4
line 1438
;1438:}
LABELV $543
endproc SP_func_train 12 8
export SP_func_static
proc SP_func_static 12 8
line 1455
;1439:
;1440:/*
;1441:===============================================================================
;1442:
;1443:STATIC
;1444:
;1445:===============================================================================
;1446:*/
;1447:
;1448:
;1449:/*QUAKED func_static (0 .5 .8) ?
;1450:A bmodel that just sits there, doing nothing.  Can be used for conditional walls and models.
;1451:"model2"	.md3 model to also draw
;1452:"color"		constantLight color
;1453:"light"		constantLight radius
;1454:*/
;1455:void SP_func_static( gentity_t *ent ) {
line 1456
;1456:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1457
;1457:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1458
;1458:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1459
;1459:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1460
;1460:}
LABELV $554
endproc SP_func_static 12 8
export SP_func_rotating
proc SP_func_rotating 16 8
line 1483
;1461:
;1462:
;1463:/*
;1464:===============================================================================
;1465:
;1466:ROTATING
;1467:
;1468:===============================================================================
;1469:*/
;1470:
;1471:
;1472:/*QUAKED func_rotating (0 .5 .8) ? START_ON - X_AXIS Y_AXIS
;1473:You need to have an origin brush as part of this entity.  The center of that brush will be
;1474:the point around which it is rotated. It will rotate around the Z axis by default.  You can
;1475:check either the X_AXIS or Y_AXIS box to change that.
;1476:
;1477:"model2"	.md3 model to also draw
;1478:"speed"		determines how fast it moves; default value is 100.
;1479:"dmg"		damage to inflict when blocked (2 default)
;1480:"color"		constantLight color
;1481:"light"		constantLight radius
;1482:*/
;1483:void SP_func_rotating (gentity_t *ent) {
line 1484
;1484:	if ( !ent->speed ) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $556
line 1485
;1485:		ent->speed = 100;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1120403456
ASGNF4
line 1486
;1486:	}
LABELV $556
line 1489
;1487:
;1488:	// set the axis of rotation
;1489:	ent->s.apos.trType = TR_LINEAR;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 2
ASGNI4
line 1490
;1490:	if ( ent->spawnflags & 4 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $558
line 1491
;1491:		ent->s.apos.trDelta[2] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
ASGNF4
line 1492
;1492:	} else if ( ent->spawnflags & 8 ) {
ADDRGP4 $559
JUMPV
LABELV $558
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $560
line 1493
;1493:		ent->s.apos.trDelta[0] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
ASGNF4
line 1494
;1494:	} else {
ADDRGP4 $561
JUMPV
LABELV $560
line 1495
;1495:		ent->s.apos.trDelta[1] = ent->speed;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
ASGNF4
line 1496
;1496:	}
LABELV $561
LABELV $559
line 1498
;1497:
;1498:	if (!ent->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $562
line 1499
;1499:		ent->damage = 2;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 2
ASGNI4
line 1500
;1500:	}
LABELV $562
line 1502
;1501:
;1502:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1503
;1503:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1505
;1504:
;1505:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1506
;1506:	VectorCopy( ent->s.pos.trBase, ent->r.currentOrigin );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 1507
;1507:	VectorCopy( ent->s.apos.trBase, ent->r.currentAngles );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 500
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 1509
;1508:
;1509:	trap_LinkEntity( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1510
;1510:}
LABELV $555
endproc SP_func_rotating 16 8
export SP_func_bobbing
proc SP_func_bobbing 28 12
line 1532
;1511:
;1512:
;1513:/*
;1514:===============================================================================
;1515:
;1516:BOBBING
;1517:
;1518:===============================================================================
;1519:*/
;1520:
;1521:
;1522:/*QUAKED func_bobbing (0 .5 .8) ? X_AXIS Y_AXIS
;1523:Normally bobs on the Z axis
;1524:"model2"	.md3 model to also draw
;1525:"height"	amplitude of bob (32 default)
;1526:"speed"		seconds to complete a bob cycle (4 default)
;1527:"phase"		the 0.0 to 1.0 offset in the cycle to start at
;1528:"dmg"		damage to inflict when blocked (2 default)
;1529:"color"		constantLight color
;1530:"light"		constantLight radius
;1531:*/
;1532:void SP_func_bobbing (gentity_t *ent) {
line 1536
;1533:	float		height;
;1534:	float		phase;
;1535:
;1536:	G_SpawnFloat( "speed", "4", &ent->speed );
ADDRGP4 $472
ARGP4
ADDRGP4 $492
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1537
;1537:	G_SpawnFloat( "height", "32", &height );
ADDRGP4 $478
ARGP4
ADDRGP4 $565
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1538
;1538:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $420
ARGP4
ADDRGP4 $421
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1539
;1539:	G_SpawnFloat( "phase", "0", &phase );
ADDRGP4 $566
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1541
;1540:
;1541:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1542
;1542:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1544
;1543:
;1544:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1545
;1545:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1547
;1546:
;1547:	ent->s.pos.trDuration = ent->speed * 1000;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 20
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1548
;1548:	ent->s.pos.trTime = ent->s.pos.trDuration * phase;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1549
;1549:	ent->s.pos.trType = TR_SINE;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 4
ASGNI4
line 1552
;1550:
;1551:	// set the axis of bobbing
;1552:	if ( ent->spawnflags & 1 ) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $567
line 1553
;1553:		ent->s.pos.trDelta[0] = height;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1554
;1554:	} else if ( ent->spawnflags & 2 ) {
ADDRGP4 $568
JUMPV
LABELV $567
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $569
line 1555
;1555:		ent->s.pos.trDelta[1] = height;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1556
;1556:	} else {
ADDRGP4 $570
JUMPV
LABELV $569
line 1557
;1557:		ent->s.pos.trDelta[2] = height;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1558
;1558:	}
LABELV $570
LABELV $568
line 1559
;1559:}
LABELV $564
endproc SP_func_bobbing 28 12
export SP_func_pendulum
proc SP_func_pendulum 44 12
line 1581
;1560:
;1561:/*
;1562:===============================================================================
;1563:
;1564:PENDULUM
;1565:
;1566:===============================================================================
;1567:*/
;1568:
;1569:
;1570:/*QUAKED func_pendulum (0 .5 .8) ?
;1571:You need to have an origin brush as part of this entity.
;1572:Pendulums always swing north / south on unrotated models.  Add an angles field to the model to allow rotation in other directions.
;1573:Pendulum frequency is a physical constant based on the length of the beam and gravity.
;1574:"model2"	.md3 model to also draw
;1575:"speed"		the number of degrees each way the pendulum swings, (30 default)
;1576:"phase"		the 0.0 to 1.0 offset in the cycle to start at
;1577:"dmg"		damage to inflict when blocked (2 default)
;1578:"color"		constantLight color
;1579:"light"		constantLight radius
;1580:*/
;1581:void SP_func_pendulum(gentity_t *ent) {
line 1587
;1582:	float		freq;
;1583:	float		length;
;1584:	float		phase;
;1585:	float		speed;
;1586:
;1587:	G_SpawnFloat( "speed", "30", &speed );
ADDRGP4 $472
ARGP4
ADDRGP4 $572
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1588
;1588:	G_SpawnInt( "dmg", "2", &ent->damage );
ADDRGP4 $420
ARGP4
ADDRGP4 $421
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 1589
;1589:	G_SpawnFloat( "phase", "0", &phase );
ADDRGP4 $566
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 1591
;1590:
;1591:	trap_SetBrushModel( ent, ent->model );
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 1594
;1592:
;1593:	// find pendulum length
;1594:	length = fabs( ent->r.mins[2] );
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1595
;1595:	if ( length < 8 ) {
ADDRLP4 0
INDIRF4
CNSTF4 1090519040
GEF4 $573
line 1596
;1596:		length = 8;
ADDRLP4 0
CNSTF4 1090519040
ASGNF4
line 1597
;1597:	}
LABELV $573
line 1599
;1598:
;1599:	freq = 1 / ( M_PI * 2 ) * sqrt( g_gravity.value / ( 3 * length ) );
ADDRGP4 g_gravity+8
INDIRF4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
MULF4
DIVF4
ARGF4
ADDRLP4 24
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
CNSTF4 1042479491
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 1601
;1600:
;1601:	ent->s.pos.trDuration = ( 1000 / freq );
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1603
;1602:
;1603:	InitMover( ent );
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitMover
CALLV
pop
line 1605
;1604:
;1605:	VectorCopy( ent->s.origin, ent->s.pos.trBase );
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1606
;1606:	VectorCopy( ent->s.origin, ent->r.currentOrigin );
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1608
;1607:
;1608:	VectorCopy( ent->s.angles, ent->s.apos.trBase );
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 60
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1610
;1609:
;1610:	ent->s.apos.trDuration = 1000 / freq;
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
CNSTF4 1148846080
ADDRLP4 4
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 1611
;1611:	ent->s.apos.trTime = ent->s.apos.trDuration * phase;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1612
;1612:	ent->s.apos.trType = TR_SINE;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 4
ASGNI4
line 1613
;1613:	ent->s.apos.trDelta[2] = speed;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 1614
;1614:}
LABELV $571
endproc SP_func_pendulum 44 12
import G_ExplodeMissile
bss
export pushed_p
align 4
LABELV pushed_p
skip 4
export pushed
align 4
LABELV pushed
skip 32768
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
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import AddTeamScore
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
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
import Team_CheckDroppedItem
import OnSameTeam
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
LABELV $572
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $566
byte 1 112
byte 1 104
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $565
byte 1 51
byte 1 50
byte 1 0
align 1
LABELV $552
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $542
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $538
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $537
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $531
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $522
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 32
byte 1 117
byte 1 110
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $492
byte 1 52
byte 1 0
align 1
LABELV $487
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 116
byte 1 110
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $478
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $475
byte 1 49
byte 1 0
align 1
LABELV $474
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $473
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $472
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $471
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 116
byte 1 49
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $470
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 116
byte 1 49
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $455
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $436
byte 1 48
byte 1 0
align 1
LABELV $435
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $421
byte 1 50
byte 1 0
align 1
LABELV $420
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $419
byte 1 56
byte 1 0
align 1
LABELV $418
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $413
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 114
byte 1 49
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $412
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 115
byte 1 47
byte 1 100
byte 1 114
byte 1 49
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $407
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 95
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $343
byte 1 49
byte 1 32
byte 1 49
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $342
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $341
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $340
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $339
byte 1 110
byte 1 111
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $303
byte 1 82
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 95
byte 1 66
byte 1 105
byte 1 110
byte 1 97
byte 1 114
byte 1 121
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $85
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 95
byte 1 112
byte 1 32
byte 1 62
byte 1 32
byte 1 38
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 91
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 84
byte 1 73
byte 1 84
byte 1 73
byte 1 69
byte 1 83
byte 1 93
byte 1 0
