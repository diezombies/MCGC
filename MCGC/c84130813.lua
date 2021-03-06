-- MC群的苦逼 DZ

function c84130813.initial_effect(c)
    -- 反转召唤
    local e1 = Effect.CreateEffect(c)
    e1:SetCategory(CATEGORY_DESTROY)
    e1:SetType(EFFECT_TYPE_SINGLE + EFFECT_TYPE_TRIGGER_F)
    e1:SetCode(EVENT_FLIP_SUMMON_SUCCESS)
    e1:SetOperation(c84130813.destroyOperation)
    c:RegisterEffect(e1)

    -- 不会被战斗破坏
    local e2 = Effect.CreateEffect(c)
    e2:SetType(EFFECT_TYPE_SINGLE)
    e2:SetCode(EFFECT_INDESTRUCTABLE_BATTLE)
    e2:SetValue(1)
    c:RegisterEffect(e2)

    -- 卡组检索、特招、送墓
    local e3 = Effect.CreateEffect(c)
    e3:SetDescription(aux.Stringid(84130813, 0))
    e3:SetCategory(CATEGORY_SEARCH + CATEGORY_SPECIAL_SUMMON + CATEGORY_TOGRAVE)
    -- 解放自己是cost
    e3:SetProperty(EFFECT_FLAG_CARD_TARGET)
    e3:SetType(EFFECT_TYPE_IGNITION)
    e3:SetRange(LOCATION_MZONE)
    e3:SetCost(c84130813.cost)
    e3:SetTarget(c84130813.target)
    e3:SetOperation(c84130813.operation)
    c:RegisterEffect(e3)
end

function c84130813.filter(c)
    return c:IsSetCard(0x2222) and c:IsType(TYPE_MONSTER)
end

function c84130813.destroyOperation(e, tp, eg, ep, ev, re, r, rp)
    c = e:GetHandler()
    Duel.Destroy(c, REASON_EFFECT)
end

function c84130813.cost(e, tp, eg, ep, ev, re, r, rp, chk)
    if chk == 0 then
        return e:GetHandler():IsReleasable()
    end
    Duel.Release(e:GetHandler(), REASON_COST)
end

function c84130813.target(e, tp, eg, ep, ev, re, r, rp, chk, chkc)
    if chk == 0 then
        return Duel.GetMatchingGroupCount(c84130813.filter, tp, LOCATION_DECK, 0, nil) >= 2
    end
    Duel.SetOperationInfo(0, CATEGORY_SPECIAL_SUMMON, nil, 1, tp, LOCATION_DECK)
end

function c84130813.operation(e, tp, eg, ep, ev, re, r, rp)
    Duel.Hint(HINT_SELECTMSG, tp, HINTMSG_SPSUMMON)
    local g = Duel.SelectMatchingCard(tp, c84130813.filter, tp, LOCATION_DECK, 0, 2, 2, nil)

    Duel.ConfirmCards(1 - tp, g)
    Duel.Hint(HINT_SELECTMSG, 1 - tp, HINTMSG_SPSUMMON)
    local sg = g:Select(1 - tp, 1, 1, nil)
    local pos = Duel.SelectPosition(tp, sg:GetFirst(), POS_FACEUP)
    g:Sub(sg)
    Duel.SendtoGrave(g, REASON_EFFECT)
    Duel.SpecialSummon(sg, SUMMON_TYPE_SPECIAL, tp, tp, false, false, pos)
end