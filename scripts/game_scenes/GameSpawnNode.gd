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
	print("Event number is now: " + str(event_number))
	
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
			pass
		19:
			pass
		20:
			
			pass
		21:
			pass
		22:
			pass
			pass
		23:
			pass
		24:
			pass
			pass
		25:
			pass
		26:
			pass
			pass
		27:
			pass
		28:
			pass
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
			pass
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
			swallower_spawn_enemy(1, 1)
			swallower_spawn_enemy(1, 3)
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
			swallower_spawn_enemy(1, 1)
			swallower_spawn_enemy(1, 3)
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
			swallower_spawn_enemy(1, 3)
		237:
			swallower_spawn_enemy(2, 3)
		238:
			swallower_spawn_enemy(1, 3)
		239:
			swallower_spawn_enemy(2, 3)
		240:
			swallower_spawn_enemy(1, 3)
		241:
			swallower_spawn_enemy(2, 3)
		242:
			swallower_spawn_enemy(1, 3)
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
			pass
		283:
			pass
		284:
			pass
		285:
			pass
		286:
			pass
		287:
			pass
		288:
			pass
		289:
			pass
		290:
			pass
		291:
			pass
		292:
			pass
		293:
			pass
		294:
			pass
		295:
			pass
		296:
			pass
		297:
			pass
		298:
			pass
		299:
			pass
		300:
			pass
		301:
			pass
		302:
			pass
		303:
			pass
		304:
			pass
		305:
			pass
		306:
			pass
		307:
			pass
		308:
			pass
		309:
			pass
		310:
			pass
		311:
			pass
		312:
			pass
		313:
			pass
		314:
			pass
		315:
			pass
		316:
			pass
		317:
			pass
		318:
			pass
		319:
			pass
		320:
			pass
		321:
			pass
		322:
			pass
		323:
			pass
		324:
			pass
		325:
			pass
		326:
			pass
		327:
			pass
		328:
			pass
		329:
			pass
		330:
			pass
		331:
			pass
		332:
			pass
		333:
			pass
		334:
			pass
		335:
			pass
		336:
			pass
		337:
			pass
		338:
			pass
		339:
			pass
		340:
			pass
		341:
			pass
		342:
			pass
		343:
			pass
		344:
			pass
		345:
			pass
		346:
			pass
		347:
			pass
		348:
			pass
		349:
			pass
		350:
			pass
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
			pass
		367:
			pass
		368:
			pass
		369:
			pass
		370:
			pass
		371:
			pass
		372:
			pass
		373:
			pass
		374:
			pass
		375:
			pass
		376:
			pass
		377:
			pass
		378:
			pass
		379:
			pass
		380:
			pass
		381:
			pass
		382:
			pass
		383:
			pass
		384:
			pass
		385:
			pass
		386:
			pass
		387:
			pass
		388:
			pass
		389:
			pass
		390:
			pass
		391:
			pass
		392:
			pass
		393:
			pass
		394:
			pass
		395:
			pass
		396:
			pass
		397:
			pass
		398:
			pass
		399:
			pass
		400:
			pass
		401:
			pass
		402:
			pass
		403:
			pass
		404:
			pass
		405:
			pass
		406:
			pass
		407:
			pass
		408:
			pass
		409:
			pass
		410:
			pass
		411:
			pass
		412:
			pass
		413:
			pass
		414:
			pass
		415:
			pass
		416:
			pass
		417:
			pass
		418:
			pass
		419:
			pass
		420:
			pass
		421:
			pass
		422:
			pass
		423:
			pass
		424:
			pass
		425:
			pass
		426:
			pass
		427:
			pass
		428:
			pass
		429:
			pass
		430:
			pass
		431:
			pass
		432:
			pass
		433:
			pass
		434:
			pass
		435:
			pass
		436:
			pass
		437:
			pass
		438:
			pass
		439:
			pass
		440:
			pass
		441:
			pass
		442:
			pass
		443:
			pass
		444:
			pass
		445:
			pass
		446:
			pass
		447:
			pass
		448:
			pass
		449:
			pass
		450:
			pass
		451:
			pass
		452:
			pass
		453:
			pass
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
			pass
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
			pass
		488:
			pass
		489:
			pass
		490:
			pass
		491:
			pass
		492:
			pass
		493:
			pass
		494:
			pass
		495:
			pass
		496:
			pass
		497:
			pass
		498:
			pass
		499:
			pass
		500:
			pass
		501:
			pass
		502:
			pass
		503:
			pass
		504:
			pass
		505:
			pass
		506:
			pass
		507:
			pass
		508:
			pass
		509:
			pass
		510:
			pass
		511:
			pass
		512:
			pass
		513:
			pass
		514:
			pass
		515:
			pass
		516:
			pass
		517:
			pass
		518:
			pass
		519:
			pass
		520:
			pass
		521:
			pass
		522:
			pass
		523:
			pass
		524:
			pass
		525:
			pass
		526:
			pass
		527:
			pass
		528:
			pass
		529:
			pass
		530:
			unready_enemy_spawner()
		531:
			pass
		532:
			pass
		533:
			pass
		534:
			pass
		535:
			pass
		536:
			pass
		537:
			pass
		538:
			pass
		539:
			pass
		540:
			pass
		541:
			pass
		542:
			pass
		543:
			pass
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
			pass
		553:
			pass
		554:
			pass
		555:
			pass
		556:
			pass
		557:
			pass
		558:
			pass
		559:
			pass
		560:
			pass
		561:
			pass
		562:
			win_game()
		563:
			pass
		564:
			pass
		565:
			pass
		566:
			pass
		567:
			pass
		568:
			pass
		569:
			pass
		570:
			pass
		571:
			pass
		572:
			pass
		573:
			pass
		574:
			pass
		575:
			pass
		576:
			pass
		577:
			pass
		578:
			pass
		579:
			pass
		580:
			pass
		581:
			pass
		582:
			pass
		583:
			pass
		584:
			pass
		585:
			pass
		586:
			pass
		587:
			pass
		588:
			pass
		589:
			pass
		590:
			pass
		591:
			pass
		592:
			pass
		593:
			pass
		594:
			pass
		595:
			pass
		596:
			pass
		597:
			pass
		598:
			pass
		599:
			pass
		600:
			pass
		601:
			pass
		602:
			pass
		603:
			pass
		604:
			pass
		605:
			pass
		606:
			pass
		607:
			pass
		608:
			pass
		609:
			pass
		610:
			pass
		611:
			pass
		612:
			pass
		613:
			pass
		614:
			pass
		615:
			pass
		616:
			pass
		617:
			pass
		618:
			pass
		619:
			pass
		620:
			pass
		621:
			pass
		622:
			pass
		623:
			pass
		624:
			pass
		625:
			pass
		626:
			pass
		627:
			pass
		628:
			pass
		629:
			pass
		630:
			pass
		631:
			pass
		632:
			pass
		633:
			pass
		634:
			pass
		635:
			pass
		636:
			pass
		637:
			pass
		638:
			pass
		639:
			pass
		640:
			pass
		641:
			pass
		642:
			pass
		643:
			pass
		644:
			pass
		645:
			pass
		646:
			pass
		647:
			pass
		648:
			pass
		649:
			pass
		650:
			pass
		651:
			pass
		652:
			pass
		653:
			pass
		654:
			pass
		655:
			pass
		656:
			pass
		657:
			pass
		658:
			pass
		659:
			pass
		660:
			pass
		661:
			pass
		662:
			pass
		663:
			pass
		664:
			pass
		665:
			pass
		666:
			pass
		667:
			pass
		668:
			pass
		669:
			pass
		670:
			pass
		671:
			pass
		672:
			pass
		673:
			pass
		674:
			pass
		675:
			pass
		676:
			pass
		677:
			pass
		678:
			pass
		679:
			pass
		680:
			pass
		681:
			pass
		682:
			pass
		683:
			pass
		684:
			pass
		685:
			pass
		686:
			pass
		687:
			pass
		688:
			pass
		689:
			pass
		690:
			pass
		691:
			pass
		692:
			pass
		693:
			pass
		694:
			pass
		695:
			pass
		696:
			pass
		697:
			pass
		698:
			pass
		699:
			pass
		700:
			pass
