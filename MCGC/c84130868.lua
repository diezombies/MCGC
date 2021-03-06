-- MC群群主的宣告

function c84130868.initial_effect(c)
    -- Activate(summon)
    local e1 = Effect.CreateEffect(c)
    e1:SetCategory(CATEGORY_DISABLE_SUMMON + CATEGORY_DESTROY)
    e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
    e1:SetType(EFFECT_TYPE_ACTIVATE)
    e1:SetCode(EVENT_SUMMON)
    e1:SetCondition(c84130868.condition1)
    e1:SetCost(c84130868.cost1)
    e1:SetTarget(c84130868.target1)
    e1:SetOperation(c84130868.activate1)
    c:RegisterEffect(e1)

    local e2 = e1:Clone()
    e2:SetCode(EVENT_FLIP_SUMMON)
    c:RegisterEffect(e2)

    local e3 = e1:Clone()
    e3:SetCode(EVENT_SPSUMMON)
    c:RegisterEffect(e3)

    -- Activate(effect)
    local e4 = Effect.CreateEffect(c)
    e4:SetCategory(CATEGORY_NEGATE + CATEGORY_DESTROY)
    e4:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
    e4:SetType(EFFECT_TYPE_ACTIVATE)
    e4:SetCode(EVENT_CHAINING)
    e4:SetCondition(c84130868.condition2)
    e4:SetCost(c84130868.cost2)
    e4:SetTarget(c84130868.target2)
    e4:SetOperation(c84130868.activate2)
    c:RegisterEffect(e4)
end

function c84130868.condition1(e, tp, eg, ep, ev, re, r, rp)
    return Duel.GetCurrentChain() == 0
end

function c84130868.cost1(e, tp, eg, ep, ev, re, r, rp, chk)
    if chk == 0 then
        return Duel.GetLP(tp) > 100
    end
    Duel.PayLPCost(tp, Duel.GetLP(tp) -100)
end

function c84130868.target1(e, tp, eg, ep, ev, re, r, rp, chk)
    if chk == 0 then
        return true
    end
    Duel.SetOperationInfo(0, CATEGORY_DISABLE_SUMMON, eg, eg:GetCount(), 0, 0)
    Duel.SetOperationInfo(0, CATEGORY_DESTROY, eg, eg:GetCount(), 0, 0)
    Duel.SetChainLimit(aux.FALSE)
end

function c84130868.activate1(e, tp, eg, ep, ev, re, r, rp)
    Duel.NegateSummon(eg)
    Duel.Destroy(eg, REASON_EFFECT)
    Duel.BreakEffect()
    g = Duel.GetMatchingGroup(c84130868.fifter, tp, LOCATION_DECK + LOCATION_GRAVE, 0, nil)
    if g:GetCount() > 0 then
        a = Duel.SelectMatchingCard(tp, c84130868.fifter, tp, LOCATION_DECK + LOCATION_GRAVE, 0, 1, 9999, nil)
        Duel.SendtoHand(a, tp, REASON_EFFECT)
    end
end

function c84130868.condition2(e, tp, eg, ep, ev, re, r, rp)
    return re:IsHasType(EFFECT_TYPE_ACTIVATE) and Duel.IsChainNegatable(ev)
end

function c84130868.cost2(e, tp, eg, ep, ev, re, r, rp, chk)
    if chk == 0 then
        return Duel.GetLP(tp) > 100
    end
    Duel.PayLPCost(tp, Duel.GetLP(tp) -100)
end

function c84130868.target2(e, tp, eg, ep, ev, re, r, rp, chk)
    if chk == 0 then
        return true
    end
    Duel.SetOperationInfo(0, CATEGORY_NEGATE, eg, 1, 0, 0)
    if re:GetHandler():IsDestructable() and re:GetHandler():IsRelateToEffect(re) then
        Duel.SetOperationInfo(0, CATEGORY_DESTROY, eg, 1, 0, 0)
    end
    Duel.SetChainLimit(aux.FALSE)
end

function c84130868.activate2(e, tp, eg, ep, ev, re, r, rp)
    Duel.NegateActivation(ev)
    if re:GetHandler():IsRelateToEffect(re) then
        Duel.Destroy(eg, REASON_EFFECT)
    end
    Duel.BreakEffect()
    g = Duel.GetMatchingGroup(c84130868.fifter, tp, LOCATION_DECK + LOCATION_GRAVE, 0, nil)
    if g:GetCount() > 0 then
        a = Duel.SelectMatchingCard(tp, c84130868.fifter, tp, LOCATION_DECK + LOCATION_GRAVE, 0, 1, 9999, nil)
        Duel.SendtoHand(a, tp, REASON_EFFECT)
    end
end

function c84130868.fifter(c)
    return c:IsCode(84130812) or c:IsCode(84130838) or c:IsCode(84130843)
end
