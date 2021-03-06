﻿脚本中用到的数据类型为以下几类：
integer:	整数类型
boolean:	布尔类型(true 或者 false)
string:		字符串
function:	函数
Card:		卡片类
Effect:		效果类
Group:		卡片组类
any:		任意类型
为方便说明，采用类似c的函数表示方法说明
[]表示有默认值可省略的参数

注：关于过滤条件函数
过滤条件函数是指第一个参数是Card类型，并且返回值是boolean的函数。此函数用于在一些获取满足条件的卡片组的过滤函数中重复调用。过滤条件函数可以有不定的参数，第二个开始的参数从过滤函数的额外参数获得。举例：
function sample_filter(c, atk, def)
	return c:GetAttack()>=atk and c:GetDefence()>=def
end
此函数对于一张卡c，如果攻击力>=atk并且守备力>=def则返回true，否则返回false
g=Duel.GetFieldGroup(0,LOCATION_HAND,0) --获取玩家1的手卡
fg=g:Filter(sample_filter, nil, 1000,500) --从g中筛选攻击力>=1000并且守备>=500的卡
Group.Filter只需要3个参数，第4个参数开始为额外参数，额外的参数会传给sample_filter

========== bit ==========
●integer bit.band(integer a, integer b)
a与b的位与
●integer bit.bor(integer a, integer b)
a与b的位或
●integer bit.bxor(integer a, integer b)
a与b的位异或
●integer bit.bls(integer a, integer b)
a左移b
●integer bit.brs(integer a, integer b)
a右移b

========== Card ==========
●integer Card.GetCode(Card c)
返回c的当前代号（可能因为效果改变）
●integer Card.GetOriginalCode(Card c)
返回c的卡片记载的代号
●boolean Card.IsSetCard(Card c, integer setname)
检查c是否是名字含有setname的卡
●integer Card.GetType(Card c)
返回c的当前类型。
●integer Card.GetOriginalType(Card c)
返回c的卡片记载的类型。
●integer Card.GetLevel(Card c)
返回c的当前等级
●integer Card.GetSynchroLevel(Card c)
返回c的同调用等级。此函数除了某些特定卡如调节支援士，返回值与Card.GetLevel(c)相同
●integer Card.GetRitualLevel(Card c)
返回c的仪式解放等级。此函数除了某些特定卡如仪式供物，返回值与Card.GetLevel(c)相同
●integer Card.GetOriginalLevel(Card c)
返回c的卡片记载的等级
●integer Card.GetAttribute(Card c)
返回c的当前属性。注：对某些多属性怪物如光与暗之龙，此函数的返回值可能是几个属性的组合值。
●integer Card.GetOriginalAttribute(Card c)
返回c的卡片记载的属性
●integer Card.GetRace(Card c)
返回c的当前种族。注：对某些多种族怪物如动画效果的魔术猿，此函数的返回值可能是几个种族的组合值。
●integer Card.GetOriginalRace(Card c)
返回c的卡片记载的种族
●integer Card.GetAttack(Card c)
返回c的当前攻击力，返回值是负数表示是"?"
●integer Card.GetBaseAttack(Card c)
返回c的原本攻击力
●integer Card.GetTextAttack(Card c)
返回c的卡片记载的攻击力
●integer Card.GetDefence(Card c)
返回c的当前守备力，返回值是负数表示是"?"
●integer Card.GetBaseDefence(Card c)
返回c的原本守备力
●integer Card.GetTextDefence(Card c)
返回c的卡片记载的守备力
●integer Card.GetOwner(Card c)
返回c的持有者
●integer Card.GetControler(Card c)
返回c的当前控制者
●integer Card.GetPreviousControler(Card c)
返回c的位置变化之前的控制者
●integer Card.GetReason(Card c)
返回c的位置变化原因
●Card Card.GetReasonCard(Card c)
返回导致c的位置变化的卡。此函数仅在某卡被战斗破坏时，因为上级召唤被解放，或者成为特殊召唤使用的素材时有效。
●Effect Card.GetReasonEffect(Card c)
返回导致c的位置变化的效果。
●integer Card.GetPosition(Card c)
返回c当前的表示形式
●integer Card.GetPreviousPosition(Card c)
返回c位置变化前的表示形式
●integer Card.GetBattlePosition(Card c)
返回c在本次战斗发生之前的表示形式
●integer Card.GetLocation(Card c)
返回c当前的所在位置
●integer Card.GetPreviousLocation(Card c)
返回c位置变化前的所在的位置
●integer Card.GetSequence(Card c)
返回c在当前位置的序号
在场上时，序号代表所在的格子，从左往右分别是0-4，场地魔法格的序号为5
在其它地方时，序号表示的是第几张卡。最底下的卡的序号为0
●integer Card.GetPreviousSequence(Card c)
返回c位置变化前的序号
●integer Card.GetSummonType(Card c)
返回c上场的方式。
●integer Card.GetSummonPlayer(Card c)
返回召唤，特殊召唤c上场的玩家
●integer Card.GetDestination(Card c)
返回c位置变化的目的地。此函数仅在处理位置转移代替效果时有效。
●integer Card.GetTurnID(Card c)
返回c转移到当前位置的回合
●integer Card.GetFieldID(Card c)
返回c转移到当前位置的时间标识。此数值唯一，越小表示c是越早出现在那个位置。
●boolean Card.IsCode(Card c, integer code)
检查c的代号是否是code。
●boolean Card.IsType(Card c, integer type)
检查c是否属于类型type。
●boolean Card.IsRace(Card c, integer race)
检查c是否属于种族race。
●boolean Card.IsAttribute(Card c, integer attribute)
检查c是否属于属性attribute。
●boolean Card.IsReason(Card c, integer reason)
检查c是否包含原因reason。
●boolean Card.IsStatus(Card c, integer status)
检查c是否包含某个状态码。
●boolean Card.IsNotTuner(Card c)
检查c是否可以当成非调整来使用。
●void Card.SetStatus(Card c, integer state, boolean enable)
给c设置或者取消状态码。除非妳清楚的了解每个状态码的含意，否则不要轻易使用此函数。
●boolean Card.IsDualState(Card c)
检查c属否处于再召唤状态。
●void Card.EnableDualState(Card c)
把c设置成再召唤状态。
●void Card.SetTurnCounter(Card c, integer counter)
设置c的回合计数器(光之护封剑等)
●integer Card.GetTurnCounter(Card c)
返回c的回合计数器
●void Card.SetCustomValue(Card c, string tag, any object)
以tag作为标签为c设置一个自定义值object
●any Card.GetCustomValue(Card c, string tag)
返回c的以tag作为标签的自定义值
●void Card.SetMaterial(Card c, Group g)
把g中的所有卡作为c的素材（上级召唤，特殊召唤）
●Group Card.GetMaterial(Card c)
返回c出场使用的素材
●integer Card.GetMaterialCount(Card c)
返回c出场使用的素材数量
●Group Card.GetEquipGroup(Card c)
返回c当前装备着的卡片组
●integer Card.GetEquipCount(Card c)
返回c当前装备着的卡片数量
●Card Card.GetEquipTarget(Card c)
返回c当前的装备对象
●boolean Card.CheckEquipTarget(Card c1, Card c2)
检查c2是否是c1的正确的装备对象
●integer Card.GetUnionCount(Card c)
返回c当前装备的同盟卡数量
●Group Card.GetOverlayGroup(Card c)
返回c当前叠放着的卡片组
●integer Card.GetOverlayCount(Card c)
返回c当前叠放着的卡片数量
●integer Card.RemoveOverlayCard(Card c,integer player, integer min, integer max, integer reason)
以reason为原因，让玩家player移除c叠放的min-max张卡
●Group Card.GetAttackGroup(Card c)
返回c本回合攻击过的卡片组
●integer Card.GetAttackedGroupCount(Card c)
返回c本回合攻击过的卡片数量
●integer Card.GetAttackedCount(Card c)
返回c本回合攻击过的次数
注：如果此值与上一个函数的返回值不同，那么说明此卡本回合进行过直接攻击
●Group Card.GetBattledGroup(Card c)
返回与c本回合进行过战斗的卡片组
进行过战斗指发生过伤害的计算。用于剑斗兽等卡的判定。
●integer Card.GetBattledGroupCount(Card c)
返回与c本回合进行过战斗的的卡片数量
●integer Card.GetAttackAnnouncedCount(Card c)
返回c本回合攻击宣言的次数
注：攻击被无效不会被计入攻击过的次数，但是会计入攻击宣言的次数。
●void Card.SetCardTarget(Card c1, Card c2)
把c2作为c1的永续对象。
c1和c2的联系会在c1活c2任意一卡离场或变成里侧表示时reset。
●Group Card.GetCardTarget(Card c)
返回c当前所有的永续对象
●integer Card.GetCardTargetCount(Card c)
返回c当前的永续对象的数量
●boolean Card.IsHasCardTarget(Card c1, Card c2)
检查c1是否取c2为永续对象
●Group Card.GetOwnerTarget(Card c)
返回取c作为永续对象的所有卡
●integer Card.GetOwnerTargetCount(Card c)
返回取c作为永续对象的卡的数量
●Effect Card.GetActivateEffect(Card c)
返回c的“卡片发动”的效果。仅对魔法和陷阱有效。
●integer Card.RegisterEffect(Card c, Effect e, [boolean forced=false])
把效果e注册给c，返回效果的全局id。
默认情况下注册时如果c带有免疫e的效果那么注册会失败。如果forced为true则不会检查c对e的免疫效果。
●boolean Card.IsHasEffect(Card c, integer code)
检查c是否受到效果种类是code的效果的影响
●integer Card.GetEffectCount(Card c, integer code)
返回c受到影响的种类是code的效果的数量
●Effect Card.RegisterFlagEffect(Card c, integer code, integer reset_flag, integer property, integer reset_count)
为c注册一个标识用效果。
注：注册给卡的标识用效果不会用于系统，即使code与内置效果code重合也不会影响，并且类型总是EFFECT_TYPE_SINGLE。reset方法，property和一般的效果相同，并且不会无效化，不受卡的免疫效果影响。
●integer Card.GetFlagEffect(Card c, integer code)
返回c的种类是code的标识效果的数量。
●void Card.ResetFlagEffect(Card c, integer code)
手动清除c的种类是code的标识效果。
●void Card.CreateRelation(Card c1, Card c2, integer reset_flag)
为c1建立于c2的联系。此联系仅会由于RESET_EVENT的事件reset。
●void Card.ReleaseRelation(Card c1, Card c2)
手动释放c1对于c2的联系
●boolean Card.IsRelateToEffect(Card c, Effect e)
检查c是否和效果e有联系。
注：每次发动进入连锁的效果时，发动效果的卡，以及发动效果时指定的对象（用Duel.SetTargetCard或者Duel.SelectTarget指定的，包括取对象和不取对象）会自动与那个效果建立联系。一旦离场，联系会重置。
●boolean Card.IsRelateToCard(Card c1, Card c2)
检查c1是否和c2有联系。
●boolean Card.IsRelateToBattle(Card c)
检查c是否和本次战斗关联。
注：此效果通常用于伤害计算后伤害阶段结束前，用于检查战斗的卡是否离场过。
●integer Card.CopyEffect(Card c, integer code, integer reset_flag, integer reset_count)
为c添加代号是code的卡的可复制的效果，并且添加额外的reset条件。
返回值是表示复制效果的代号id。
●void Card.EnableReviveLimit(Card c)
为c添加苏生限制。此函数也可通过Card.SetStatus实现。
●void Card.CompleteProcedure(Card c)
使c完成正规的召唤手续。此函数也可通过Card.SetStatus实现。
●boolean Card.IsDisabled(Card c)
检查c是否处于无效状态
●boolean Card.IsDestructable(Card c)
检查c是否是可破坏的。
注：不可破坏指的是类似场地护罩，宫廷的规矩等“破壊できない”的效果
●boolean Card.IsSummonableCard(Card c)
检查c是否是可通常召唤的卡。
●boolean Card.IsSpecialSummonable(Card c)
检查是否可以对c进行特殊召唤手续。
●boolean Card.IsSynchroSummonable(Card c, [Card tuner=nil])
检查是否可以以tuner作为调整对c进行同调召唤手续。如果tuner是nil，此函数与上一个函数作用相同。
●boolean Card.IsSummonable(Card c)
检查c是否可进行通常召唤（不包含通常召唤的set)
●boolean Card.IsMSetable(Card c)
检查c是否可进行通常召唤的set
●boolean Card.IsSSetable(Card c)
检查c是否可以set到魔法陷阱区
●boolean Card.IsCanBeSpecialSummoned(Card c, Effect e, integer sumtype, integer sumplayer, boolean nocheck, boolean nolimit, [integer sumpos=POS_FACEUP, integer target_player=sumplayer])
检查c是否可以被玩家sumplayer用效果e以sumtype方式和sumpos表示形式特殊召唤到target_player场上。如果nocheck是true则不检查c的召唤条件，如果nolimit是true则不检查c的苏生限制。
●boolean Card.IsAbleToHand(Card c)
检查c是否可以送去手牌。
注：仅当卡片或者玩家受到“不能加入手牌”的效果的影响时（如雷王）此函数才返回false。以下几个函数类似。
●boolean Card.IsAbleToDeck(Card c)
检查c是否可以送去卡组。
●boolean Card.IsAbleToExtra(Card c)
检查c是否可以送去额外卡组。
对于非融合，同调，超量卡此函数均返回false。
●boolean Card.IsAbleToGrave(Card c)
检查c是否可以送去墓地。
●boolean Card.IsAbleToRemove(Card c)
检查c是否可以除外。
●boolean Card.IsAbleToHandAsCost(Card c)
检查c是否可以作为cost送去手牌。
注：此函数会在Card.IsAbleToHand的基础上追加检测c的实际目的地。当c送往手牌会被送去其它地方时（如缩退回路适用中，或者c是融合，同调和超量怪的一种），此函数返回false。以下几个函数类似。
●boolean Card.IsAbleToDeckAsCost(Card c)
检查c是否可以作为cost送去卡组。
●boolean Card.IsAbleToExtraAsCost(Card c)
检查c是否可以作为cost送去额外卡组。
●boolean Card.IsAbleToGraveAsCost(Card c)
检查c是否可以作为cost送去墓地。
●boolean Card.IsAbleToRemoveAsCost(Card c)
检查c是否可以作为cost除外。
●boolean Card.IsReleaseable(Card c)
检查c是否可以解放（非上级召唤用）
●boolean Card.IsDiscardable(Card c)
检查c是否可以丢弃
注：此函数仅用于检测，以REASON_DISCARD作为原因把一张手卡送墓并不会导致那张卡不能丢弃。
●boolean Card.IsAttackable(Card c)
检查c是否可以攻击
●boolean Card.IsChainAttackable(Card c)
检查c是否可以连续攻击
注：当c因为闪光之双剑等效果进行过多次攻击之后此函数返回false。
●boolean Card.IsFaceup(Card c)
检查c是否是表侧表示
●boolean Card.IsFacedown(Card c)
检查c是否是里侧测表示
●boolean Card.IsAttack(Card c)
检查c是否是攻击表示
●boolean Card.IsDefence(Card c)
检查c是否是守备表示
●boolean Card.IsControler(Card c, integer con)
检查c的当前控制着是否是con
●boolean Card.IsOnField(Card c)
检查c是否在场。
注：当怪物召唤，反转召唤，特殊召唤时召唤成功之前，此函数返回false
●boolean Card.IsLocation(Card c, integer loc)
检查c当前位置是否是loc。
注：当怪物召唤，反转召唤，特殊召唤时召唤成功之前，并且loc=LOCATION_MZONE时，此函数返回false
●boolean Card.IsPublic(Card c)
检查c是否处于公开状态
●boolean Card.IsForbidden(Card c)
检查c是否处于被宣言禁止状态
●boolean Card.IsAbleToChangeControler(Card c)
检查c是否可以改变控制权
注：仅当卡收到了“不能改变控制权”的效果的影响时，此函数返回false
●boolean Card.IsControlerCanBeChanged(Card c)
检查c的控制权是否可以改变
注：此函数会在上一个函数的基础上追加检测场上的空格位
●void Card.AddCounter(Card c, integer countertype, integer count)
为c放置count个countertype类型的指示物
●void Card.RemoveCounter(Card c, integer player, integer countertype, integer count, integer reason)
让玩家player以原因reason移除c上的count个countertype类型的指示物
●integer Card.GetCounter(Card c, integer countertype)
返回c上的countertype类型的指示物的数量
●void Card.EnableCounterPermit(Card c, integer countertype)
允许c放置那个需要“可以放置”才能放置的指示物countertype
●void Card.SetCounterLimit(Card c, integer countertype, integer count)
设定c放置countertype类型指示物的上限
●boolean Card.IsCanTurnSet(Card c)
检查c是否可以转成里侧表示。
●boolean Card.IsCanAddCounter(Card c, integer countertype, integer count)
检查c是否可以放置count个countertype类型的指示物
●boolean Card.IsCanRemoveCounter(Card c, integer player, integer countertype, integer count, integer reason)
检查玩家player是否可以以原因reason移除c上的count个countertype类型的指示物
●boolean Card.IsCanBeFusionMaterial(Card c)
检查c是否可以成为融合素材
●boolean Card.IsCanBeSynchroMaterial(Card c)
检查c是否可以成为同调素材
●boolean Card.IsCanBeExceedMaterial(Card c)
检查c是否可以成为超量素材
●boolean Card.CheckFusionMaterial(Card c, Group g)
检查g是否包含了c需要的一组融合素材
●boolean Card.IsImmuneToEffect(Card c, Effect e)
检查c是否免疫效果e（即不受效果e的影响）
●boolean Card.IsCanBeEffectTarget(Card c, Effect e)
检查c是否可以成为效果e的对象
●boolean Card.IsCanBeBattleTarget(Card c1, Card c2)
检查c1是否可以成为c2的攻击目标
●void Card.AddTrapMonsterAttribute(Card c, boolean is_effect)
为c添加陷阱怪物属性。is_effect=true表示视作效果怪物，否则视为通常怪物
注：陷阱怪物属性指的是同时作为怪物和陷阱，并且额外使一个魔法陷阱的格子不能使用。
●void Card.CancelToGrave(Card c)
取消送墓确定状态。
注：送墓确定状态指的是在场上发动的不留场的魔法和陷阱后，这些卡片的状态。送墓确定状态中的卡无法返回手牌和卡组，并且连锁结束时送去墓地。此函数的作用是取消此状态使其留场。用于光之护封剑和废铁稻草人等卡。
●integer,integer Card.GetTributeRequirement(Card c)
返回通常召唤c所需要的祭品的最小和最大数量
========== Effect ==========
●Effect Effect.CreateEffect(Card c)
新建一个空效果,并且效果的拥有者为c
●Effect Effect.Clone(Effect e)
新建一个效果e的副本
●void Effect.Reset(Effect e)
把效果e重置。重置之后不可以再使用此效果
●void Effect.SetDescription(Effect e, integer desc)
为效果e设置效果描述
●void Effect.SetCode(Effect e, integer code)
为效果e设置Code属性
●void Effect.SetRange(Effect e, integer range)
为效果e设置Range属性
●void Effect.SetTargetRange(Effect e, integer s_range, integer o_range)
为效果e设置Target Range属性
s_range指影响的我方区域。o_range值影响的对方区域。
如果property属性中指定了EFFECT_FLAG_ABSOLUTE_RANGE标志，那么s_range指玩家1收到影响的区域，o_range指玩家2受到影响的区域。
如果这是一个特殊召唤手续(EFFECT_SPSUMMON_PROC)的效果，并且property指定了EFFECT_FLAG_SPSUM_PARAM标志，那么s_range表示特殊召唤到的哪个玩家的场地，o_range表示可选择的表示形式。
●void Effect.SetAbsoluteRange(Effect e, integer s_range, integer o_range)
设置target range属性并设置EFFECT_FLAG_ABSOLUTE_RANGE标志
●void Effect.SetCountLimit(Effect e, integer count)
设置一回合可以发动的次数（仅触发型效果有效）
●void Effect.SetReset(Effect e, integer reset_flag, [integer reset_count=1])
设置reset参数
●void Effect.SetReset(Effect e, integer type)
设置Type属性
●void Effect.SetProperty(Effect e, integer prop)
设置Property属性
●void Effect.SetLabel(Effect e, integer label)
设置Label属性
●void Effect.SetCategory(Effect e, integer cate)
设置Category属性
●void Effect.SetCategory(Effect e, integer cate)
设置Category属性
●void Effect.SetCondition(Effect e, function con_func)
设置Condition属性
●void Effect.SetCost(Effect e, function cost_func)
设置Cost属性
●void Effect.SetTarget(Effect e, function targ_func)
设置Target属性
●void Effect.SetOperation(Effect e, function op_func)
设置Operation属性
●void Effect.SetValue(Effect e, integer|function val)
设置Value属性
●void Effect.SetOwnerPlayer(Effect e, integer player)
设置Owner player属性
●integer Effect.GetDescription(Effect e)
返回效果描述
●integer Effect.GetCode(Effect e)
返回code属性
●integer Effect.GetType(Effect e)
返回Type属性
●integer Effect.GetProperty(Effect e)
返回Property属性
●integer Effect.GetLabel(Effect e)
返回Label属性
●integer Effect.GetCategory(Effect e)
返回Category属性
●Card Effect.GetOwner(Effect e)
返回效果拥有者
●Card Effect.GetHandler(Effect e)
返回效果在哪一张卡上生效(通常是注册该效果的卡)
●function Effect.GetCondition(Effect e)
返回condition属性
●function Effect.GetCost(Effect e)
返回cost属性
●function Effect.GetTarget(Effect e)
返回target属性
●function Effect.GetOperation(Effect e)
返回operation属性
●function|integer Effect.GetValue(Effect e)
返回value属性
●boolean Effect.IsHasProperty(Effect e, integer prop)
检查效果是否含有标志prop
●boolean Effect.IsHasCategory(Effect e, integer cate)
检查效果是否含有效果分类cate
●boolean Effect.IsHasType(Effect e, integer type)
检查效果是否属于类型type

========== group ==========
●Group Group.CreateGroup()
新建一个空的卡片组
●void Group.CreateGroup(Group g)
删除卡片组g
●Group Group.Clone(Group g)
新建卡片组g的副本
●Group Group.FromCards(Card c, ...)
不定参数，把传入的所有卡组合成一个卡片组并返回
●void Group.Clear(Group g)
清空卡片组
●void Group.AddCard(Group g, Card c)
往g中增加c
●void Group.RemoveCard(Group g, Card c)
把c从g中移除
●Card Group.GetFirst(Group g)
返回g中第一张卡，并重置当前指针到g中第一张卡。如果g中不存在卡则返回nil
●Card Group.GetNext(Group g)
返回并使指针指向下一张卡。如果g中不存在卡则返回nil
●integer Group.GetCount(Group g)
返回g中卡的数量
●void Group.ForEach(Group g, function f)
以g中的每一张卡作为参数调用一次f
●Group Group.Filter(Group g, function f, Card ex, ...)
过滤函数。从g中筛选满足筛选条件f并且不等于ex的卡。从第4个参数开始为额外参数。
●integer Group.FilterCount(Group g, function f, Card ex, ...)
过滤函数。和上一个函数基本相同。不同指出在于此函数只返回满足条件的卡的数量。
●Group Group.FilterSelect(Group g, integer player, function f,integer min, integer max, Card ex, ...)
过滤函数。让玩家player从g中选择min-max张满足筛选条件f并且不等于ex的卡。从第7个参数开始为额外参数。
●Group Group.Select(Group g, integer player, integer min, integer max, Card ex)
让玩家player从g中选择min-max张不等于ex的卡。
●Group Group.RandomSelect(Group g, integer player, integer count)
让玩家player从g中随机选择count张卡。因为是随机算则，所以参数player基本无用，由系统随机选取。
●boolean Group.IsExists(Group g, function f, integer count, Card ex, ...)
过滤函数。检查g中是否存在至少count张满足筛选条件f并且不等于ex的卡。从第5个参数开始为额外参数。
●boolean Group.CheckWithSumEqual(Group g, function f, integer sum, integer min)
子集求和判定函数。f为返回一个interger值的函数（通常用于同调判定）。检查g中是否存在一个数量至少为min的子集满足以f对子集的每一个元素求值的和等于sum。
比如：g:CheckWithSumEqual(Card.GetSynchroLevel,7,2)检查g中是否存在一个子集满足子集的同调用等级之和等于7
●Group Group.SelectWithSumEqual(Group g, integer player, function f, integer sum, integer min)
让玩家player从g中选取一个数量至少是min的子集使子集的特定函数的和等于sum
●boolean Group.CheckWithSumGreater(Group g, function f, integer sum)
子集求和判定函数之二。f为返回一个interger值的函数（通常用于仪式判定）。检查g中是否存在一个子集满足以f对子集的每一个元素求值的和刚好大于或者等于sum。
比如：g:CheckWithSumGreater(Card.GetRitualLevel,8)检查g中是否存在一个子集满足子集的仪式用等级之和大于等于8
注：判定必须是“刚好”大于或者等于。以等级为例，要使等级合计大于等于8，可以选择LV1+LV7而不可以选择LV1+LV4+LV4
●Group Group.SelectWithSumGreater(Group g, integer player, function f, integer sum)
让玩家player从g中选取一个子集使子集的特定函数的和大于等于sum
●Group Group.GetMinGroup(Group g, function f)
f为返回一个interger值的函数。从g中筛选出具有最小的f的值的卡。用于地裂等卡。
●Group Group.GetMaxGroup(Group g, function f)
f为返回一个interger值的函数。从g中筛选出具有最大的f的值的卡。用于地碎等卡。
●integer Group.GetSum(Group g, function f)
计算g中所有卡的取值的总和。f为为每张卡的取值函数。
●integer Group.GetSortCount(Group g, function f)
计算g中所有卡的种类数量。f为分类的依据，返回相同的值视为同一种类。
●Group Group.Remove(Group g, function f, ...)
过滤函数。从g中移除满足筛选条件f的所有卡。第三个参数开始是额外参数。
●Group Group.Merge(Group g1, Group g2)
把g2中的所有卡合并到g1。
注：g2本身不会发生变化。
●boolean Group.IsContains(Group g, Card c)
检查g中是否存在卡片c
●Card Group.SearchCard(Group g, function f, ...)
过滤函数。返回g中满足筛选条件f的第一张卡。第三个参数为额外参数。

========== Duel ==========
●integer Duel.GetLP(integer player)
返回玩家player的当前LP
●void Duel.SetLP(integer player, integer lp)
设置玩家player的当前LP为lp
●integer Duel.GetTurnPlayer()
返回当前的回合玩家
●integer Duel.GetTurnCount()
返回当前的回合数
●integer Duel.GetDrawCount(integer player)
返回玩家player每回合的规则抽卡数量
●void Duel.DebugMessage(any msg)
Debug用函数，用于显示信息
●void Duel.RegisterEffect(Effect e, integer player)
把效果作为玩家player的效果注册给全局环境。
●Effect Duel.RegisterFlagEffect(integer player, integer code, integer reset_flag, integer property, integer reset_count)
此函数为玩家player注册全局环境下的标识效果。此效果总是影响玩家的(EFFECT_FLAG_PLAYER_TARGET)并且不会被无效化。其余部分与Card.RegisterFlagEffect相同
●integer Duel.GetFlagEffect(integer player, integer code)
返回玩家player的特定的标识效果的数量
●void Duel.ResetFlagEffect(integer player, integer code)
手动reset玩家player的特定的标识效果
●integer Duel.Destroy(Card|Group targets, integer reason)
以reason原因破坏targets。返回值是实际被破坏的数量。
如果reason包含REASON_RULE，则破坏事件将不会检查卡片是否免疫效果，不会触发代破效果并且无视“不能破坏”。
●integer Duel.Remove(Card|Group targets, integer pos, integer reason)
以reason原因，pos表示形式除外targets。返回值是实际被操作的数量。
如果reason包含REASON_TEMPORARY，那么视为是暂时除外，可以通过Duel.ReturnToField返回到场上
●integer Duel.SendtoGrave(Card|Group targets, integer reason)
以reason原因把targets送去墓地。返回值是实际被操作的数量。
●integer Duel.SendtoHand(Card|Group targets, integer player | nil, integer reason)
以reason原因把targets送去玩家player的手牌。返回值是实际被操作的数量。
如果player是nil则返回卡的持有者的手牌。
●integer Duel.SendtoDeck(Card|Group targets, integer player | nil, integer seq, integer reason)
以reason原因把targets送去玩家player的卡组。返回值是实际被操作的数量。
如果player是nil则返回卡的持有者的卡组。
如果seq=0，则是返回卡组最顶端；seq=1则是返回卡组最低端；其余情况则是返回最顶端并且标记需要洗卡组。
●Group Duel.GetOperatedGroup()
此函数返回之前一次卡片操作实际操作的卡片组。包括Duel.Destroy, Duel.Remove, Duel.SendtoGrave, Duel.SendtoHand, Duel.SendtoDeck, Duel.Release, Duel.ChangePosition, Duel.SpecialSummon
●void Duel.Summon(integer player, Card c, boolean ignore_count, Effect e)
让玩家以效果e对c进行通常召唤（非set)。如果e=nil,那么就按照一般的通常召唤规则进行通常召唤。如果ignore_count=true，则忽略每回合的通常召唤次数限制。
●void Duel.SpecialSummonRule(integer player, Card c)
让玩家player对c进行特殊召唤手续。
●void Duel.SynchroSummon(integer player, Card c, Card tuner)
让玩家player以tuner作为调整对c进行特殊召唤手续。
●void Duel.MSet(integer player, Card c, boolean ignore_count, Effect e)
让玩家以效果e对c进行通常召唤的Set。如果e=nil,那么就按照一般的通常召唤规则进行通常召唤。如果ignore_count=true，则忽略每回合的通常召唤次数限制。
●void Duel.SSet(integer player, Card c)
让玩家player把c放置到魔法陷阱区
●Card Duel.CreateToken(integer player, integer code, integer setcode, integer attack, integer defence, integer level, integer race, integer attribute)
以传入的参数数值新建一个Token
●integer Duel.SpecialSummon(Card|Group targets, integer sumtype, integer sumplayer, integer target_player, boolean nocheck, boolean nolimit, integer pos)
让玩家player以sumtype方式，pos表示形式把targets特殊召唤到target_player场上。如果nocheck为true则无视卡的召唤条件。如果nolimit为true则无视卡的苏生限制。返回值是特殊召唤成功的卡的数量。
●boolean Duel.SpecialSummonStep(Card c, integer sumtype, integer sumplayer, integer target_player, boolean nocheck, boolean nolimit, integer pos)
此函数是上一个函数的分解过程，只特殊召唤一张卡c。此函数用于一个效果需要双方同时特殊召唤时。此函数必须和下面的函数一起使用。返回值表示是否特殊召唤成功。
●integer Duel.SpecialSummonComplete()
此函数在确定复数个上一个函数调用完毕之后调用。用于触发事件。
●void Duel.RemoveCounter(integer player, integer s, integer o, integer countertype, integer count, integer reason)
让玩家player移除场上存在的countertype类型的count个指示物。s表示对player来说的己方的可移除指示物的位置，o表示对player来说的对方的可移除指示物的位置
●boolean Duel.IsCanRemoveCounter(integer player, integer s, integer o, integer countertype, integer count, integer reason)
检查玩家player是否能移除场上的countertype类型的count个指示物。s和o参数作用同上。
●integer Duel.GetCounter(integer player, integer s, integer o, integer countertype)
返回场上存在的countertype类型的指示物的数量。s和o参数作用同上。
●integer Duel.ChangePosition(Card|Group targets,integer au, [integer ad=au, integer du=au, integer dd=au, boolean noflip=false])
改变targets的表示形式。表侧攻击表示的变成au，里侧攻击表示的变成ad, 表侧守备表示变成du,里侧守备表示变成dd
如果noflip=true则不触发翻转效果（但会触发翻转时的诱发效果）
●integer Duel.Release(Card|Group targets, integer reason)
以reason原因解放targets。返回值是实际解放的数量。
如果reason含有REASON_COST，则不会检查卡片是否不受效果影响
●void Duel.MoveToField(Card c, integer move_player, integer target_player,integer dest, integer pos, boolean enabled)
让玩家move_player把c移动的target_player的场上。dest只能是LOCATION_MZONE或者LOCATION_SZONE。pos表示可选表示形式。enable表示是否立刻适用c的效果。
●void Duel.ReturnToField(Card c)
把c返回到场上。c必须是以REASON_TEMPORARY原因离场，并且离场后没有离开过那个位置。
●void Duel.MoveSequence(Card c, integer seq)
移动c的序号。通常用于在场上换格子或者在卡组中移动到最上方或者最下方。
●void Duel.SetChainLimit(function f)
设定连锁条件。f是接受一个Effect类型作为参数并且返回boolean值的函数。在cost或者target处理中调用此函数可以限制可以连锁的效果的种类（如超融合）。如果f返回false表示不能连锁。一旦设置连锁条件后发生了新的连锁那么连锁条件将会解除。
●void Duel.SetChainLimitTillChainEnd(function f)
功能同上，但是此函数设定的连锁条件直到连锁结束才会解除。
●Effect Duel.GetChainMaterial(integer player)
返回玩家player受到的连锁素材的效果。此函数仅用于融合类卡的效果。
●void Duel.ConfirmDeckTop(integer player, integer count)
确认玩家player卡组最上方的count张卡。双方均可确认。
●void Duel.ConfirmCards(integer player, Card|Group targets)
给玩家player确认targets
●void Duel.SortDecktop(integer sort_player, integer target_player, integer count)
让玩家sort_player对玩家target_player的卡组最上方count张卡进行排序
●boolean Duel.CheckEvent(integer event)
检查当前是否是event时点
●void Duel.RaiseEvent(Group eg,integer code, Effect reason_effect, integer reason, integer reason_player,integer event_player, integer event param)
触发一个事件。
●void Duel.RaiseSingleEvent(Card ec,integer code, Effect reason_effect, integer reason, integer reason_player,integer event_player, integer event param)
触发一个单体事件。
●integer, integer Duel.GetEnvironment()
返回两个值，表示当前场地代号，以及当前场地效果的来源玩家。场地代号指当前生效的场地卡的代号，或者海神的巫女把场地变化效果的值。来源玩家指当前生效的场地卡的控制者，或者海神的巫女等卡的控制者。
●void Duel.Win(function f, Effect e, integer player)
在当前效果处理完之后调用f进行胜负检测。e和player作为f的两个参数传递给f。f返回值的低16位表示胜负判定玩家，0表示玩家1胜利，1表示玩家2胜利，2表示平局，此外是无胜负兵继续进行。高16位表示胜负的原因。
●integer Duel.Draw(integer player, integer count, integer reason)
让玩家player以原因reason抽count张卡。返回实际抽的卡的数量。
如果reason含有REASON_RULE则此次抽卡不受“不能抽卡”的效果的影响。
●integer Duel.Damage(integer player, integer value, integer reason)
以reason原因给与玩家player造成value的伤害。返回实际收到的伤害值。如果受到伤害变成回复等效果的影响时，返回值为0.
●integer Duel.Recover(integer player, integer value, integer reason)
以reason原因使玩家player回复value的LP。返回实际的回复值。如果受到回复变成伤害等效果的影响时，返回值为0.
●boolean Duel.Equip(integer player, Card c1, Card c2)
把c1作为玩家player的装备卡装备给c2。返回值表示是否成功。
●boolean Duel.GetControler(integer player, Card c)
让玩家player得到c的控制权。返回值表示是否成功。
●boolean Duel.SwapControler(Card c1, Card c2)
交换c1和c2的控制权。返回值表示是否成功。
●boolean Duel.CheckLPCost(integer player, integer cost)
检查玩家player是否能支付cost点lp
●void Duel.PayLPCost(integer player, integer cost)
让玩家player支付cost点lp
●integer Duel.DiscardDeck(integer player, integer count, integer reason)
以原因reason把玩家player的卡组最上端count张卡送去墓地.返回实际转移的数量。
●integer Duel.DiscardHand(integer player, function f, integer min, integer max, integer reason, Card ex, ...)
过滤函数。让玩家player选择并丢弃满足筛选条件f兵不等于ex的min-max张手卡。第7个参数开始为额外参数。
●void Duel.DisableShuffleCheck()
使下一个操作不检查是否需要洗卡组或者洗手卡。
注：如果不调用此函数，除了调用Duel.DiscardDeck和Duel.Draw之外从卡组中取出卡或者把卡加入手卡或者把卡加入卡组（非最上端或最底端）时，系统会自动在效果处理结束时洗卡组或手卡。如果不希望如此，比如从卡组顶端除外一张卡等操作，那么需要调用此函数。此函数仅保证紧接着的一次操作不会进行洗卡检测。
●void Duel.ShuffleDeck(integer player)
手动洗玩家player的卡组
●void Duel.ShuffleHand(integer player)
手动洗玩家player的手卡
注：以上两个操作会重置洗卡检测的状态。
●void Duel.ChaingeAttacker(Card c)
把当前的攻击卡替换成c进行攻击
●void Duel.ReplaceAttacker(Card c)
用c代替当前攻击的卡进行伤害阶段
●void Duel.ChaingeAttackTarget(Card c)
把当前的攻击目标替换成c。如果c=nil则变成直接攻击。
●void Duel.ReplaceAttackTarget(Card c)
(预留）
●integer Duel.GetBattleDamage(integer player)
返回玩家player在本次战斗中收到的伤害
●void Duel.ChangeBattleDamage(integer player, integer value)
把玩家player在本次战斗中收到的伤害变成value
●void Duel.ChangeTarget(integer chainc, Group g)
把连锁chainc的对象换成g
●void Duel.ChangeTargetPlayer(integer chainc, integer player)
把连锁chainc的对象玩家换成player
●void Duel.ChangeTargetParam(integer chainc, integer param)
把连锁chainc的对象参数换成param
●void Duel.BreakEffect()
中断当前效果，使之后的效果处理视为不同时处理。此函数会造成错时点。
●void Duel.ChangeChainOperation(integer chainc, function f)
把连锁chainc的效果的处理函数换成f。用于实现“把效果变成”等的效果
●void Duel.NegateActivation(integer chainc)
使连锁chainc的发动无效
●void Duel.NegateEffect(integer chainc)
使连锁chainc的效果无效
●void Duel.NegateSummon(Card c)
使正在召唤，反转召唤，特殊召唤的c的召唤无效
●void Duel.IncreaseSummonCount()
本回合的通常召唤限制计数+1
●boolean Duel.CheckSummonCount()
检查回合玩家本回合的通常召唤限制计数。
●integer Duel.GetLocationCount(integer player, integer location)
返回玩家player的指定场地location剩余的空格数。location只能是LOCATION_MZONE或者LOCATION_SZONE。
●Card Duel.GetFieldCard(integer controler, integer location, integer sequence)
返回指定玩家指定地点指定序号的卡
●integer Duel.GetCurrentChain()
返回当前正在处理的连锁序号
●... Duel.GetChainInfo(integer chainc, ...)
返回连锁chainc的信息。如果chainc=0，则返回当前正在处理的连锁的信息。
此函数根据传入的参数个数按顺序返回相应数量的返回值。参数可以是:
CHAININFO_CHAIN_COUNT			连锁序号
CHAININFO_TRIGGERING_EFFECT		连锁的效果
CHAININFO_TRIGGERING_PLAYER		连锁的玩家
CHAININFO_TRIGGERING_CONTROLER		连锁发生位置所属玩家
CHAININFO_TRIGGERING_LOCATION		连锁发生位置
CHAININFO_TRIGGERING_SEQUENCE		连锁发生的位置的序号
CHAININFO_TARGET_CARDS			连锁的对象卡片组
CHAININFO_TARGET_PLAYER			连锁的对象玩家
CHAININFO_TARGET_PARAM			连锁的对象参数
CHAININFO_DISABLE_REASON		连锁被无效的原因效果
CHAININFO_DISABLE_PLAYER		连锁被无效的原因玩家
CHAININFO_CHAIN_ID			连锁的唯一标识
举例：Duel.GetChainInfo(0,CHAININFO_TRIGGERING_LOCATION,CHAININFO_TARGET_CARDS)将会返回当前连锁发生的位置和对象卡。
●integer Duel.GetCurrentPhase()
返回当前的阶段
●void Duel.SkipPhase(integer player, integer phase, integer reset_flag, integer reset_count)
跳过玩家player的phase阶段，并在特定的阶段后reset。reset参数和效果相同。
●boolean Duel.IsDamageCalculated()
用于在伤害阶段检查是否已经计算了战斗伤害。
●Card Duel.GetAttacker()
返回此次战斗攻击的卡
●Card Duel.GetAttackTarget()
返回此次战斗被攻击的卡。如果返回nil表示是直接攻击。
●void Duel.DisableAttack()
使本次攻击无效
●void Duel.ChainAttack()
使攻击卡再进行一次连续攻击（开辟，破灭的女王）
●void Duel.Readjust()
刷新场上的卡的信息。非特定情况或者不清楚原理请勿使用此函数以免形成死循环。
●Group Duel.GetFieldGroup(integer player, integer s, integer o)
返回指定位置的卡。s指对玩家player来说的己方的位置，o指对玩家player来说的对方的位置。下面提到的指定位置均为此意。
比如Duel.GetFieldGroup(0,LOCATION_GRAVE,LOCATION_MZONE)返回玩家1墓地和玩家2的怪兽区的所有卡
●integer Duel.GetFieldGroupCount(integer player, integer s, integer o)
同上，返回值变成卡的数量
●Group Duel.GetDecktopGroup(integer player, integer count)
返回玩家player的卡组最上方的count张卡
●Group Duel.GetMatchingGroup(function f, integer player, integer s, integer o, Card ex, ...)
过滤函数，返回指定位置满足过滤条件f并且不等于ex的卡。第6个参数开始为额外参数。
●integer Duel.GetMatchingGroupCount(function f, integer player, integer s, integer o, Card ex, ...)
同上，返回值变成符合的卡的数量。
●Card Duel.GetFirstMatchingCard(function f, integer player, integer s, integer o, Card ex, ...)
过滤函数，返回指定位置满足过滤条件f并且不等于ex的第一张卡。第6个参数开始为额外参数。
●boolean Duel.IsExistingMatchingCard(function f, integer player, integer s, integer o, integer count, Card ex, ...)
过滤函数，检查指定位置是否存在至少count张满足过滤条件f并且不等于ex的卡。第7个参数开始为额外参数。
●Group Duel.SelectMatchingCard(integer sel_player, function f, integer player, integer s, integer o, integer min, integer max, Card ex, ...)
过滤函数，让玩家sel_player选择指定位置满足过滤条件f并且不等于ex的min-max张卡。第9个参数开始为额外参数。
●Group Duel.GetReleaseGroup(integer player)
返回玩家player可解放（非上级召唤用)的卡片组
●integer Duel.GetReleaseGroupCount(integer player)
返回玩家player可解放（非上级召唤用)的卡片数量
●boolean Duel.ChecktReleaseGroup(integer player, function f, integer count, Card ex, ...)
过滤函数，检查玩家player是否存在至少count张不等于ex的满足条件f的可解放的卡
●Group Duel.SelectReleaseGroup(integer player, function f, integer min, integer max, Card ex, ...)
过滤函数，让玩家player选择min-max张不等于ex的满足条件f的可解放的卡并返回
●Group Duel.GetTributeGroup(Card c)
返回用于通常召唤c可解放（上级召唤用)的卡片组
●integer Duel.GetTributeCount(Card c)
返回用于通常召唤c的祭品数量。此数量不一定等于上一个函数的返回值中的卡片数量。因为某些卡可以作为两个祭品来使用。
●Group Duel.SelectTribute(integer player, Card c, integer min, integer max)
让玩家player选择用于通常召唤c的min-max个祭品。
●integer Duel.GetTargetCount(function f, integer player, integer s, integer o, Card ex, ...)
基本同Duel.GetMatchingGroupCount，不同之处在于需要追加判定卡片是否能成为当前正在处理的效果的对象。
●boolean Duel.IsExistingTarget(function f, integer player, integer s, integer o, integer count, Card ex, ...)
过滤函数，检查指定位置是否存在至少count张满足过滤条件f并且不等于ex并且可以成为当前正在处理的效果的对象的卡。第7个参数开始为额外参数。
●Group Duel.SelectTarget(integer sel_player, function f, integer player, integer s, integer o, integer min, integer max, Card ex, ...)
过滤函数，让玩家sel_player选择指定位置满足过滤条件f并且不等于ex并且可以成为当前正在处理的效果的对象的min-max张卡。第9个参数开始为额外参数。此函数会同时酱当前正在处理的连锁的对象设置成选择的卡
●Group Duel.SelectFusionMaterial(integer player, Card c, Group g)
让玩家player从g中选择一组满足c的融合素材的卡
●void Duel.SetFusionMaterial(Group g)
设置g为需要使用的融合素材
●void Duel.SetSynchroMaterial(Group g)
设置g为需要使用的同调素材
●Group Duel.SelectSynchroMaterial(integer player, Card c, function f1, function f2, integer min)
让玩家选择用于同调c需要的满足条件的数量至少是min的一组素材。
f1是调整需要满足的过滤条件。f2是调整以外的部分需要满足的过滤条件。
●boolean Duel.CheckSynchroMaterial(Card c, function f1, function f2, integer min)
检查是否存在一组满足条件的卡作为同调召唤c的素材。f1,f2,min同上。
●Group Duel.SelectTunerMaterial(integer player, Card c, Card tuner, function f1, function f2, integer min)
让玩家选择用于同调c需要的满足条件的以tuner作为调整的数量至少是min的一组素材。
f1是调整需要满足的过滤条件。f2是调整以外的部分需要满足的过滤条件。
●boolean Duel.CheckTunerMaterial(Card c, Card tuner, function f1, function f2, integer min)
检查以tuner作为调整是否存在一组满足条件的卡作为同调召唤c的素材。f1,f2,min同上。
●Group Duel.GetRitualMaterial(integer player)
返回玩家player可用的用于仪式召唤素材的卡片组。包含手上，场上可解放的以及墓地的仪式魔人等卡。
●void Duel.ReleaseRitualMaterial(Group g)
解放仪式用的素材g。如果是墓地的仪式魔人等卡则除外。
●void Duel.SetTargetCard(Group g)
把当前正在处理的连锁的对象设置成g。
注，这里的对象指的的广义的对象，包括不取对象的效果可能要处理的对象。
●void Duel.SetTargetPlayer(integer player)
把当前正在处理的连锁的对象玩家设置成player。
●void Duel.SetTargetParam(integer param)
把当前正在处理的连锁的对象参数设置成param。
●void Duel.SetOperationInfo(integer chainc, integer category, Card|Group targets, integer count, integer target_player, integer target_param)
设置当前处理的连锁的操作信息。此操作信息包含了效果处理中确定要处理的效果分类。比如潜行狙击手需要设置CATEGORY_DICE，但是不能设置CATEGORY_DESTROY，因为不确定。对于破坏效果，targets需要设置成发动时可能成为连锁的影响对象的卡，并设置count为发动时确定的要处理的卡的数量。比如黑洞发动时，targets需要设定为场上的所有怪物，count设置成场上的怪的数量。对于CATEGORY_SPECIAL_SUMMON,CATEGORY_TOHAND,CATEGORY_TODECK等分类，如果取对象则设置targets为对象，count为对象的数量；如果不取对象则设置targets为nil,count为预计要处理的卡的数量，并设置target_param为预计要处理的卡的位置。例如增援：SetOperationInfo(0,CATEGORY_TOHAND,nil,1,0,LOCATION_DECK)。操作信息用于很多效果的发动的检测，例如星尘龙，王家沉眠之谷等。
●... Duel.GetOperationInfo(integer chainc, integer category)
返回连锁chainc的category分类的操作信息。返回值为5个，第一个返回值是false的话表示不存在该分类。后4个返回值对应上一个函数的后4个参数。
●integer Duel.GetOperationCount(integer chainc)
返回连锁chainc包含的操作分类的数量
●Group Duel.GetExceedMaterial(Card c)
返回c的超量素材
●void Duel.Overlay(Card c, Card|Group ocard)
把ocard作为c的叠放卡叠放
●Group Duel.GetOverlayGroup(integer player, integer s, integer o)
返回指定位置的所有叠放的卡
●Integer Duel.GetOverlayCount(integer player, integer s, integer o)
返回指定位置的所有叠放的卡的数量
●void Duel.RemoveOverlayCard(integer player, integer s, integer o, integer min, integer max, integer reason)
以reason原因移除指定位置的min-max张叠放卡
●void Duel.Hint(integer player, integer desc)
给玩家发送内置消息提示
●boolean Duel.SelectEffectYesNo(integer player, integer code)
让玩家选择是否发动卡的效果
●boolean Duel.SelectYesNo(integer player, integer desc)
让玩家选择是或否
●integer Duel.SelectOption(integer player, ...)
让玩家选择选项。从第二个参数开始，每一个参数代表一条选项。
返回选择的选项的序号。
●integer Duel.SelectDisableField(integer player, integer count, integer s, integer o, integer filter)
让玩家player选择指定位置的count个位置不能使用。
●integer Duel.AnnounceRace(integer player, integer count, integer available)
让玩家player从可选的种族中宣言count个种族。available是所有可选种族的组合值。
●integer Duel.AnnounceAttribute(integer player, integer count, integer available)
让玩家player从可选的属性中宣言count个属性。available是所有可选属性的组合值。
●integer Duel.AnnounceCard(integer player)
让玩家player宣言一个卡片代号。
●integer Duel.AnnounceType(integer player)
让玩家player宣言一个卡片类型。
●integer Duel.AnnounceNumber(integer player, ...)
让玩家player宣言一个数字。从第二个参数开始，每一个参数代表一个可宣言的数字。
返回选择的选项的序号。
●integer Duel.AnnounceCoin(integer player)
让玩家player宣言硬币的正反面。
●... Duel.TossCoin(integer player, integer count)
让玩家player投count次硬币。返回值为count个结果。结果是0或者1.
●... Duel.TossDice(integer player, integer count)
让玩家player投count次骰子。返回值为count个结果。结果是1-6.
●void Duel.SetCoinResult( ... )
强行修改投硬币的结果。此函数用于永续的EVENT_TOSS_COIN事件中
●void Duel.SetDiceResult( ... )
强行修改投骰子的结果。此函数用于永续的EVENT_TOSS_DICE事件中
●boolean Duel.IsPlayerAffectByEffect(integer player, integer code)
检查玩家player是否受特性效果的影响
●boolean Duel.IsPlayerCanDraw(integer player)
检查玩家player是否可以效果抽卡
●boolean Duel.IsPlayerCanDiscardDeck(integer player)
检查玩家player是否可以把卡组顶端的卡送去墓地
●boolean Duel.IsPlayerCanDiscardDeckAdCost(integer player, int count)
检查玩家player是否可以把卡组顶端的卡送去墓地作为cost。当卡组没有足够数量的卡，或者当卡组中的卡受到送墓转移效果的影响时（如大宇宙，次元裂缝，即使不是全部）此函数会返回false
●boolean Duel.IsPlayerCanSummon(integer player, integer sumtype, Card c)
检查玩家player是否可以以sumtype方式通常召唤c。仅当玩家收到“不能上级召唤”等效果的影响时返回false。
●boolean Duel.IsPlayerCanFlipSummon(integer player, Card c)
检查玩家player是否可以反转召唤c。
●boolean Duel.IsPlayerCanSpecialSummonMonster(integer player, integet code, integer setcode, integer attack, integer defence integer level, integer race, integer attribute, [integer pos=POS_FACEUP, integer target_player=player])
检查玩家player是否可以以pos的表示形式特殊召唤特定属性值的怪物到target_player场上。此函数通常用于判定是否可以特招token和陷阱怪物。
●boolean Duel.IsPlayerCanRelease(integer player, Card c)
检查玩家是否能解放c
●boolean Duel.IsPlayerCanRemove(integer player, Card c)
检查玩家是否能除外c
●boolean Duel.IsPlayerCanSendtoHand(integer player, Card c)
检查玩家是否能把c送去手牌
●boolean Duel.IsPlayerCanSendtoGrave(integer player, Card c)
检查玩家是否能把c送去墓地
●boolean Duel.IsPlayerCanSendtoDeck(integer player, Card c)
检查玩家是否能把c送去卡组
●boolean Duel.IsChainInactivatable(integer chainc)
检查连锁chainc的发动是否可以被无效化
●boolean Duel.IsChainDisablable(integer chainc)
检查连锁chainc的效果是否可以被无效化
●boolean Duel.CheckChainTarget(integer chainc, Card c)
检查c是否是连锁chainc的正确的对象
●boolean Duel.CheckChainUniqueness()
检查当前连锁中是否存在同名卡的发动。true表示无同名卡。
●boolean Duel.SwapDeckAndGrave(integer player)
现世与冥界的逆转专用。把玩家player的卡组和墓地交换
●boolean Duel.CheckSummonActivity(integer player)
检查玩家player本回合有没有进行过召唤的行为。召唤被无效视作进行过召唤行为。
●boolean Duel.CheckNormalSummonActivity(integer player)
检查玩家player本回合有没有进行过通常召唤的行为。包括召唤和set
●boolean Duel.CheckFlipSummonActivity(integer player)
检查玩家player本回合有没有进行过反转召唤的行为。
●boolean Duel.CheckFlipSummonActivity(integer player)
检查玩家player本回合有没有进行过特殊召唤的行为。
特殊召唤的行为包括：进行了入连锁和不入连锁的特殊召唤；发动了确定要特殊召唤的效果但是效果被无效
不包括：发动了确定要特殊召唤的效果但是发动被无效
●boolean Duel.CheckAttackActivity(integer player)
检查玩家player本回合有没有进行过攻击。