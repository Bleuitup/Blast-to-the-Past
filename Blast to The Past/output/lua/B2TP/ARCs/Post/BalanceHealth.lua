-- ARCs and the SPARC use vanilla's Thunderdome values (thunderdome/ThunderdomeBalanceHealth.lua:
-- 2000 health, 500 armor) in every game mode.
--
-- Vanilla's Thunderdome file lowers kARCHealth but not kARCDeployedHealth (2600), and deploying
-- keeps the health fraction (LiveMixin:AdjustMaxHealth), so a Thunderdome ARC's health jumps 30% when
-- it deploys and drops back when it packs up. Deployed health is set to the same 2000 here, so
-- deploying changes nothing. Armor still goes to 0 while deployed and comes back on undeploy.
--
-- The SPARC is kept equal to the ARC. Vanilla's Thunderdome file leaves it at 2600 / 400.
--
-- Load order: the Thunderdome file loads at the end of BalanceHealth.lua, before this Post hook.
kARCHealth = 2000 --was 2600
kARCDeployedHealth = 2000 --was 2600
kARCArmor = 500 --was 400
kDISHealth = 2000 --was 2600
kDISDeployedHealth = 2000 --was 2600
kDISArmor = 500 --was 400
