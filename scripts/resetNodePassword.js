import com.hivext.api.environment.Environment;

var APPID = hivext.local.getParam("TARGET_APPID"),
    sNewPassword = '${user.appPassword}',
    nNodesLength,
    oEnvNodes,
    oResp,
    i;

oEnvService = hivext.local.exp.wrapRequest(new Environment(APPID, session));

oEnvInfoResp = oEnvService.getEnvInfo();
oEnvNodes = toNative(oEnvInfoResp).nodes;

nNodesLength = oEnvNodes.length;

for (i = 0; i < nNodesLength; i += 1) {
    oResp = oEnvService.resetNodePasswordById({
        nodeType: 'postgres9',
        password: sNewPassword,
        nodeId: oEnvNodes[i].id
    });
}
    
return {
    result: 0
};
