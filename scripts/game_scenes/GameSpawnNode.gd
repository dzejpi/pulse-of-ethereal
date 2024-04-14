extends Node


onready var game_window = $"../../GameWindow"
onready var enemy_spawner_ship = $"../../GameWindow/EnemySpawner/enemy_spawner_ship"
onready var powerup_spawner = $"../../GameWindow/PowerUpSpawner"
onready var modular_swallower = $"../../GameWindow/EnemyBosses/ModularSwallower"
onready var modular_thinker = $"../../GameWindow/EnemyBosses/ModularThinker"


func _ready():
	# Test functions
	if global_var.debug:
		pass


func change_rotation(target_rotation):
	game_window.rotate_game_window(target_rotation)


func change_spaceship_speed(new_speed):
	game_window.change_spaceship_speed(new_speed)


func ready_enemy_spawner():
	enemy_spawner_ship.is_hidden = false
	
	
func unready_enemy_spawner():
	enemy_spawner_ship.is_hidden = true


func spawn_enemy(enemy_number, spawn_position):
	enemy_spawner_ship.spawn_enemy(enemy_number, spawn_position)


func swallower_spawn_enemy(enemy_number, spawn_position):
	modular_swallower.spawn_enemy(enemy_number, spawn_position)


func summon_swallower():
	modular_swallower.is_hidden = false
	

func dismiss_swallower():
	modular_swallower.is_hidden = true


func thinker_spawn_enemy(enemy_number, spawn_position):
	modular_thinker.spawn_enemy(enemy_number, spawn_position)


func summon_thinker():
	modular_thinker.is_hidden = false
	
	
func dismiss_thinker():
	modular_thinker.is_hidden = true


func win_game():
	game_window.is_game_won = true


# Lord forgive me for what I'm about to do
func trigger_event(event_number):
	if global_var.debug:
		# Fast forward for debugging purposes
		var skip_adjustment = 0
		event_number += skip_adjustment
	
	#print("Event number is now: " + str(event_number))
	
	
	match(event_number):
		0:
			pass
		1:
			pass
		2:
			pass
		3:
			pass
		4:
			pass
		5:
			pass
		6:
			pass
		7:
			pass
		8:
			pass
		9:
			pass
		10:
			pass
		11:
			pass
		12:
			pass
		13:
			pass
		14:
			pass
		15:
			pass
		16:
			ready_enemy_spawner()
		17:
			pass
		18:
			pass
		19:
			pass
		20:
			
			pass
		21:
			pass
		22:
			pass
		23:
			pass
		24:
			pass
		25:
			pass
		26:
			pass
		27:
			pass
		28:
			pass
		29:
			pass
		30:
			pass
		31:
			pass
		32:
			pass
		33:
			spawn_enemy(1, 1)
		34:
			pass
		35:
			pass
		36:
			pass
		37:
			spawn_enemy(1, 2)
		38:
			pass
		39:
			pass
		40:
			pass
		41:
			spawn_enemy(1, 3)
		42:
			pass
		43:
			pass
		44:
			pass
		45:
			spawn_enemy(1, 1)
		46:
			pass
		47:
			pass
		48:
			pass
		49:
			spawn_enemy(1, 2)
		50:
			pass
		51:
			pass
		52:
			pass
		53:
			spawn_enemy(1, 3)
		54:
			pass
		55:
			pass
		56:
			pass
		57:
			pass
		58:
			pass
		59:
			pass
		60:
			pass
		61:
			pass
		62:
			pass
		63:
			pass
		64:
			pass
		65:
			spawn_enemy(2, 2)
		66:
			pass
		67:
			spawn_enemy(2, 3)
		68:
			pass
		69:
			spawn_enemy(2, 1)
		70:
			pass
		71:
			spawn_enemy(2, 2)
		72:
			pass
		73:
			spawn_enemy(2, 3)
		74:
			pass
		75:
			spawn_enemy(2, 1)
		76:
			pass
		77:
			spawn_enemy(2, 2)
		78:
			pass
		79:
			spawn_enemy(2, 3)
		80:
			pass
		81:
			spawn_enemy(2, 1)
		82:
			pass
		83:
			spawn_enemy(2, 2)
		84:
			pass
		85:
			spawn_enemy(2, 3)
		86:
			pass
		87:
			spawn_enemy(2, 1)
		88:
			pass
		89:
			spawn_enemy(2, 2)
		90:
			pass
		91:
			spawn_enemy(2, 3)
		92:
			pass
		93:
			spawn_enemy(2, 1)
		94:
			pass
		95:
			spawn_enemy(2, 2)
		96:
			pass
		97:
			pass
		98:
			pass
		99:
			pass
		101:
			pass
		102:
			pass
		103:
			pass
		104:
			pass
		105:
			spawn_enemy(3, 1)
		106:
			pass
		107:
			pass
		108:
			pass
		109:
			spawn_enemy(3, 2)
		110:
			pass
		111:
			pass
		112:
			pass
		113:
			spawn_enemy(3, 3)
		114:
			pass
		115:
			pass
		116:
			pass
		117:
			spawn_enemy(3, 1)
		118:
			pass
		119:
			pass
		120:
			pass
		121:
			spawn_enemy(3, 2)
		122:
			pass
		123:
			pass
		124:
			pass
		125:
			spawn_enemy(3, 3)
		126:
			pass
		127:
			pass
		128:
			pass
		129:
			spawn_enemy(3, 1)
		130:
			pass
		131:
			pass
		132:
			pass
		133:
			spawn_enemy(3, 2)
		134:
			pass
		135:
			pass
		136:
			pass
		137:
			spawn_enemy(3, 3)
		138:
			pass
		139:
			pass
		140:
			spawn_enemy(2, 1)
			spawn_enemy(2, 2)
			spawn_enemy(2, 3)
		141:
			pass
		142:
			pass
		143:
			pass
		144:
			pass
		145:
			pass
		146:
			spawn_enemy(2, 1)
			spawn_enemy(2, 2)
			spawn_enemy(2, 3)
		147:
			pass
		148:
			pass
		149:
			pass
		150:
			unready_enemy_spawner()
		151:
			pass
		152:
			pass
		153:
			pass
		154:
			pass
		155:
			pass
		156:
			pass
		157:
			pass
		158:
			pass
		159:
			pass
		160:
			pass
		161:
			summon_swallower()
		162:
			pass
		163:
			pass
		164:
			pass
		165:
			pass
		166:
			pass
		167:
			pass
		168:
			pass
		169:
			pass
		170:
			pass
		171:
			pass
		172:
			pass
		173:
			pass
		174:
			swallower_spawn_enemy(1, 1)
			swallower_spawn_enemy(1, 3)
		175:
			pass
		176:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		177:
			pass
		178:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		179:
			pass
		180:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		181:
			pass
		182:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		183:
			pass
		184:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		185:
			pass
		186:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		187:
			pass
		188:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		189:
			pass
		190:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		191:
			pass
		192:
			pass
		193:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		194:
			pass
		195:
			pass
		196:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		197:
			pass
		198:
			pass
		199:
			pass
		200:
			swallower_spawn_enemy(3, 1)
			swallower_spawn_enemy(3, 3)
		201:
			pass
		202:
			swallower_spawn_enemy(3, 1)
			swallower_spawn_enemy(3, 3)
		203:
			pass
		204:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
			swallower_spawn_enemy(3, 1)
			swallower_spawn_enemy(3, 3)
		205:
			pass
		206:
			swallower_spawn_enemy(3, 1)
			swallower_spawn_enemy(3, 3)
		207:
			pass
		208:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
			swallower_spawn_enemy(3, 1)
			swallower_spawn_enemy(3, 3)
		209:
			pass
		210:
			pass
		211:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		212:
			pass
		213:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		214:
			pass
		215:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		216:
			pass
		217:
			pass
		218:
			pass
		219:
			pass
		220:
			pass
		221:
			pass
		222:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		223:
			pass
		224:
			pass
		225:
			swallower_spawn_enemy(2, 1)
			swallower_spawn_enemy(2, 3)
		226:
			pass
		227:
			pass
		228:
			pass
		229:
			pass
		230:
			pass
		231:
			pass
		232:
			pass
		233:
			pass
		234:
			swallower_spawn_enemy(2, 1)
		235:
			swallower_spawn_enemy(2, 3)
		236:
			pass
		237:
			swallower_spawn_enemy(2, 3)
		238:
			pass
		239:
			swallower_spawn_enemy(2, 3)
		240:
			pass
		241:
			swallower_spawn_enemy(2, 3)
		242:
			pass
		243:
			swallower_spawn_enemy(2, 3)
		244:
			pass
		245:
			pass
		246:
			pass
		247:
			pass
		248:
			pass
		249:
			pass
		250:
			pass
		251:
			pass
		252:
			pass
		253:
			pass
		254:
			pass
		255:
			pass
		256:
			dismiss_swallower()
		257:
			pass
		258:
			pass
		259:
			pass
		260:
			pass
		261:
			pass
		262:
			pass
		263:
			pass
		264:
			pass
		265:
			pass
		266:
			pass
		267:
			pass
		268:
			pass
		269:
			pass
		270:
			pass
		271:
			pass
		272:
			ready_enemy_spawner()
		273:
			pass
		274:
			pass
		275:
			pass
		276:
			pass
		277:
			pass
		278:
			pass
		279:
			pass
		280:
			pass
		281:
			pass
		282:
			spawn_enemy(2, 1)
		283:
			pass
		284:
			spawn_enemy(2, 2)
		285:
			pass
		286:
			spawn_enemy(2, 3)
		287:
			pass
		288:
			pass
		289:
			spawn_enemy(1, 1)
		290:
			pass
		291:
			pass
		292:
			pass
		293:
			spawn_enemy(1, 3)
		294:
			pass
		295:
			pass
		296:
			spawn_enemy(2, 1)
		297:
			pass
		298:
			pass
		299:
			spawn_enemy(2, 2)
		300:
			pass
		301:
			pass
		302:
			spawn_enemy(2, 3)
		303:
			pass
		304:
			pass
		305:
			spawn_enemy(2, 1)
		306:
			pass
		307:
			pass
		308:
			spawn_enemy(2, 2)
		309:
			pass
		310:
			pass
		311:
			spawn_enemy(2, 3)
		312:
			pass
		313:
			pass
		314:
			pass
		315:
			spawn_enemy(2, 1)
			spawn_enemy(2, 3)
		316:
			pass
		317:
			pass
		318:
			pass
		319:
			spawn_enemy(2, 1)
			spawn_enemy(2, 3)
		320:
			pass
		321:
			pass
		322:
			spawn_enemy(1, 1)
		323:
			pass
		324:
			pass
		325:
			pass
		326:
			spawn_enemy(1, 3)
		327:
			pass
		328:
			pass
		329:
			pass
		330:
			spawn_enemy(1, 2)
		331:
			pass
		332:
			pass
		333:
			spawn_enemy(3, 1)
		334:
			spawn_enemy(3, 2)
		335:
			spawn_enemy(3, 3)
		336:
			spawn_enemy(3, 1)
		337:
			spawn_enemy(3, 2)
		338:
			spawn_enemy(3, 3)
		339:
			pass
		340:
			pass
		341:
			spawn_enemy(2, 1)
		342:
			spawn_enemy(2, 2)
		343:
			spawn_enemy(2, 3)
		344:
			spawn_enemy(2, 1)
		345:
			spawn_enemy(2, 2)
		346:
			spawn_enemy(2, 3)
		347:
			pass
		348:
			pass
		349:
			pass
		350:
			unready_enemy_spawner()
		351:
			pass
		352:
			pass
		353:
			pass
		354:
			summon_thinker()
		355:
			pass
		356:
			pass
		357:
			pass
		358:
			pass
		359:
			pass
		360:
			pass
		361:
			pass
		362:
			pass
		363:
			pass
		364:
			pass
		365:
			pass
		366:
			thinker_spawn_enemy(2, 1)
		367:
			thinker_spawn_enemy(2, 1)
		368:
			thinker_spawn_enemy(2, 3)
		369:
			thinker_spawn_enemy(2, 1)
		370:
			thinker_spawn_enemy(2, 3)
		371:
			thinker_spawn_enemy(2, 1)
		372:
			thinker_spawn_enemy(2, 3)
		373:
			thinker_spawn_enemy(2, 1)
		374:
			thinker_spawn_enemy(2, 3)
		375:
			thinker_spawn_enemy(2, 1)
		376:
			thinker_spawn_enemy(2, 3)
		377:
			thinker_spawn_enemy(2, 1)
		378:
			thinker_spawn_enemy(2, 3)
		379:
			thinker_spawn_enemy(2, 1)
		380:
			thinker_spawn_enemy(2, 3)
		381:
			thinker_spawn_enemy(2, 1)
		382:
			thinker_spawn_enemy(2, 3)
		383:
			thinker_spawn_enemy(2, 1)
		384:
			thinker_spawn_enemy(2, 3)
		385:
			thinker_spawn_enemy(2, 1)
		386:
			thinker_spawn_enemy(2, 3)
		387:
			thinker_spawn_enemy(2, 1)
		388:
			thinker_spawn_enemy(2, 3)
		389:
			thinker_spawn_enemy(1, 1)
		390:
			thinker_spawn_enemy(1, 3)
		391:
			pass
		392:
			thinker_spawn_enemy(3, 1)
		393:
			thinker_spawn_enemy(3, 3)
		394:
			thinker_spawn_enemy(3, 1)
		395:
			thinker_spawn_enemy(3, 3)
		396:
			thinker_spawn_enemy(2, 1)
		397:
			thinker_spawn_enemy(2, 1)
		398:
			pass
		399:
			pass
		400:
			pass
		401:
			thinker_spawn_enemy(3, 1)
		402:
			pass
		403:
			pass
		404:
			thinker_spawn_enemy(3, 3)
		405:
			pass
		406:
			pass
		407:
			thinker_spawn_enemy(3, 1)
		408:
			pass
		409:
			pass
		410:
			thinker_spawn_enemy(3, 3)
		411:
			thinker_spawn_enemy(2, 1)
		412:
			thinker_spawn_enemy(2, 3)
		413:
			thinker_spawn_enemy(2, 1)
		414:
			thinker_spawn_enemy(2, 3)
		415:
			thinker_spawn_enemy(2, 1)
		416:
			thinker_spawn_enemy(2, 3)
		417:
			thinker_spawn_enemy(1, 1)
		418:
			thinker_spawn_enemy(1, 3)
		419:
			thinker_spawn_enemy(2, 1)
		420:
			thinker_spawn_enemy(2, 3)
		421:
			thinker_spawn_enemy(2, 1)
		422:
			thinker_spawn_enemy(2, 3)
		423:
			pass
		424:
			pass
		425:
			thinker_spawn_enemy(2, 1)
		426:
			thinker_spawn_enemy(2, 3)
		427:
			pass
		428:
			pass
		429:
			thinker_spawn_enemy(2, 1)
		430:
			thinker_spawn_enemy(2, 3)
		431:
			pass
		432:
			pass
		433:
			thinker_spawn_enemy(2, 1)
			thinker_spawn_enemy(2, 3)
		434:
			pass
		435:
			thinker_spawn_enemy(2, 1)
			thinker_spawn_enemy(2, 3)
		436:
			pass
		437:
			thinker_spawn_enemy(3, 1)
			thinker_spawn_enemy(3, 3)
		438:
			pass
		439:
			thinker_spawn_enemy(2, 1)
			thinker_spawn_enemy(2, 3)
		440:
			pass
		441:
			thinker_spawn_enemy(3, 1)
			thinker_spawn_enemy(3, 3)
		442:
			pass
		443:
			thinker_spawn_enemy(2, 1)
			thinker_spawn_enemy(2, 3)
		444:
			pass
		445:
			thinker_spawn_enemy(3, 1)
			thinker_spawn_enemy(3, 3)
		446:
			pass
		447:
			thinker_spawn_enemy(2, 1)
			thinker_spawn_enemy(2, 3)
		448:
			pass
		449:
			thinker_spawn_enemy(3, 1)
			thinker_spawn_enemy(3, 3)
		450:
			pass
		451:
			thinker_spawn_enemy(2, 1)
			thinker_spawn_enemy(2, 3)
		452:
			pass
		453:
			thinker_spawn_enemy(3, 1)
			thinker_spawn_enemy(3, 3)
		454:
			pass
		455:
			pass
		456:
			pass
		457:
			pass
		458:
			pass
		459:
			pass
		460:
			pass
		461:
			pass
		462:
			pass
		463:
			pass
		464:
			dismiss_thinker()
		465:
			pass
		466:
			pass
		467:
			pass
		468:
			pass
		469:
			pass
		470:
			pass
		471:
			pass
		472:
			pass
		473:
			pass
		474:
			pass
		475:
			pass
		476:
			ready_enemy_spawner()
		477:
			pass
		478:
			pass
		479:
			pass
		480:
			pass
		481:
			pass
		482:
			pass
		483:
			pass
		484:
			pass
		485:
			pass
		486:
			pass
		487:
			spawn_enemy(2, 1)
		488:
			pass
		489:
			spawn_enemy(2, 2)
		490:
			pass
		491:
			spawn_enemy(2, 3)
		492:
			pass
		493:
			spawn_enemy(2, 1)
		494:
			pass
		495:
			spawn_enemy(2, 2)
		496:
			pass
		497:
			spawn_enemy(2, 3)
		498:
			pass
		499:
			pass
		500:
			spawn_enemy(2, 1)
		501:
			spawn_enemy(2, 2)
		502:
			spawn_enemy(2, 3)
		503:
			spawn_enemy(2, 3)
		504:
			spawn_enemy(2, 2)
		505:
			spawn_enemy(2, 1)
		506:
			spawn_enemy(2, 1)
		507:
			spawn_enemy(2, 1)
		508:
			spawn_enemy(2, 1)
		509:
			spawn_enemy(2, 1)
		510:
			spawn_enemy(2, 2)
		511:
			spawn_enemy(2, 2)
		512:
			spawn_enemy(2, 2)
		513:
			spawn_enemy(2, 2)
		514:
			spawn_enemy(2, 3)
		515:
			spawn_enemy(2, 3)
		516:
			spawn_enemy(2, 3)
		517:
			spawn_enemy(2, 3)
		518:
			spawn_enemy(1, 1)
			spawn_enemy(1, 3)
		519:
			pass
		520:
			pass
		521:
			pass
		522:
			spawn_enemy(1, 1)
			spawn_enemy(1, 3)
		523:
			pass
		524:
			pass
		525:
			pass
		526:
			spawn_enemy(1, 1)
			spawn_enemy(1, 3)
		527:
			pass
		528:
			spawn_enemy(2, 1)
		529:
			spawn_enemy(2, 1)
		530:
			spawn_enemy(2, 3)
		531:
			spawn_enemy(2, 3)
		532:
			spawn_enemy(2, 2)
		533:
			spawn_enemy(2, 2)
		534:
			pass
		535:
			spawn_enemy(3, 1)
			spawn_enemy(3, 3)
		536:
			pass
		537:
			spawn_enemy(3, 1)
			spawn_enemy(3, 3)
		538:
			pass
		539:
			spawn_enemy(3, 1)
			spawn_enemy(3, 3)
		540:
			pass
		541:
			spawn_enemy(3, 1)
			spawn_enemy(3, 3)
		542:
			pass
		543:
			spawn_enemy(3, 1)
			spawn_enemy(3, 3)
		544:
			pass
		545:
			pass
		546:
			pass
		547:
			pass
		548:
			pass
		549:
			pass
		550:
			pass
		551:
			pass
		552:
			spawn_enemy(2, 1)
			spawn_enemy(2, 2)
			spawn_enemy(2, 3)
		553:
			spawn_enemy(2, 1)
			spawn_enemy(2, 2)
			spawn_enemy(2, 3)
		554:
			spawn_enemy(2, 1)
			spawn_enemy(2, 2)
			spawn_enemy(2, 3)
		555:
			spawn_enemy(2, 1)
			spawn_enemy(2, 2)
			spawn_enemy(2, 3)
		556:
			pass
		557:
			pass
		558:
			unready_enemy_spawner()
		559:
			pass
		560:
			pass
		561:
			pass
		562:
			win_game()
