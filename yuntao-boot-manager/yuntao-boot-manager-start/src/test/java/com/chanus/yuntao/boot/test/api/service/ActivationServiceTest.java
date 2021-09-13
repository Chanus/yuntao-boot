/*
 * Copyright (c) 2021 Chanus
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.chanus.yuntao.boot.test.api.service;

import com.chanus.yuntao.boot.manager.common.AESKeyConsts;
import com.chanus.yuntao.boot.manager.service.ActivationService;
import com.chanus.yuntao.boot.test.BaseSpringBootTest;
import com.chanus.yuntao.utils.core.encrypt.AESUtils;
import com.chanus.yuntao.utils.core.encrypt.RSAUtils;
import com.chanus.yuntao.utils.core.lang.Message;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

/**
 * ActivationService 单元测试
 *
 * @author Chanus
 * @date 2021-09-13 15:38:20
 * @since 1.2.0
 */
public class ActivationServiceTest extends BaseSpringBootTest {
    @Autowired
    private ActivationService activationService;

    public String activationPrivateKey = "Czp3plg5xd7HfH7PGpy2EfJf1CJMbZR8DT7rJMRiqA5qEK4XKgIBya24kWIgyMqgy4cUr6Rj71LWiLfLtP2I99z7aTbHBP6ZLgiASxcO0ky5ihrsNwdcHM0/8e0IouDqAJj/Tv3OjiYygjqbzAnPU5qmcs/1C+HjLuUzbDJNdOyTgBSRuBVXjPA3HNBsRM18kLB3WMOukbcq8NvkrEdI7NgqGTSetBGCYK630nN12yzIQuot6cbqk+T2M9FqIiHCoVFyqv6GkLnZ5D+H/NPOboD+cqshgd4obT9YAqJ8RLXko1Qj8D3GPzu+D6gDU9oaE1SzQTxshE42qcNpLbnUUFmDzH9srFzalYjN34aQcwBLUylfTrf44tWjPWKdQDFLcvZdXrWFaTCuRDn73AOgSeGzSntftBNYIrNN7DdgAp6qCrX2efsEY8m49x0DDo53pVPH3UL7DaPKIHb3aRHZ4LrZa868l6qdUDMc2Lud1MacMZlYJTLHsiBWKmHKAefc+XwpjRxl3jepTrWxgtnllcC25TicJtbqkDTyUJnE3Csp1WN466BtHF726xQairjX3M1Kkbm5ZZ4kRhy95SMryRzORdp2huu/UtDEMxUU9nlNey3/6J6tfhKr6NKEcPqAkhztZctnaLFxDy5ObnmIXyd6Q2B34NQ3d9Xb2qbAg01Px3fUENwfn1e9W8PDVWhNmAqnoVyvcHow3g9OEhR2s6f86fWuxQALCbXSmWKaE5i+lO1oBuNpOjrndUaSITHbFaXyOuFcTG6DvNCGsj62qXVAGgktJRWmtquY4HaxlenSrhw/OeGx2ItzFFfCqoVyni5WzJ5ckoQs63bzRFzcHjt0cXeFljkqypIJmiMZuY491n8pjrEjfQ1KNq4i0XlXbZtUa2BJddoAPt2tnWbPe66BNCuLl4oD5FZcqjfvReTwJXjOaUSu6WQ16B3l6OuSWIsCxfwGat7OXUuv/PAw4tpONkmOgIdmPIqcXw92jdSVIEAy5q2m29GjQ0+4ClBhae0Gm4rDrlrpwdnHkQ1hejXDe2v0ystNsmVVbohcFv0YEPHTg3tlc+T5Smm4BnFNudoX0/Y+wQ3ctFwMBp5MVOUsHtXTSyml//etl1TUsKvRz+lEZ+pv/MLTeA0NEMkN";
    public String activationPublicKey = "MrT+Uh2Ixxymi7vmd/7rVV8hwzF42puc2cHUy0NU3CRo/RNE8v66YyTFzhguc/FhcVZzGXbj4Hhb0ndYEK/qBbpll3PSEYiUjtuRuR80e195hmvCGVAWO/XnMn0wdWsu2Xd0u7bxK9Eht3KFVae6m+4qA0TADaMG6V+Upya133Dfb/Qj4On+sBkpcIEzSlRpmgPKsIiA6Rg8A9xdKWryx8yrRKS7wlhDDZK4eL3NLV1OWVZr/JgC34Ll1UPhJkzlJ+7+qZczJ/pq75UvBDzkilvBgcrQGICmCFEmYfSkDK0=";

    @Test
    public void generateActivationKey() {
        Map<String, String> keyPair = RSAUtils.generateKeyPair();
        System.out.println("RSAPrivateKey : " + AESUtils.encryptWithEcb(keyPair.get("RSAPrivateKey"), AESKeyConsts.KEY_ACTIVATION));
        System.out.println("RSAPublicKey : " + AESUtils.encryptWithEcb(keyPair.get("RSAPublicKey"), AESKeyConsts.KEY_ACTIVATION));
    }

    @Test
    public void generateActivationCodeTest() {
        String name = "yuntao-boot-manager";
        String version = "1.2.x";
        // Set<String> macAddress = SystemUtils.getHostMac();
        String macAddress = "0";
        String expireDate = "2021-09-09";
        String enable = "1";

        String activationCode = activationService.generateActivationCode(name, version, macAddress, expireDate, enable, activationPrivateKey);
        System.out.println(activationCode);
    }

    @Test
    public void verifyActivationCodeTest() {
        String activationCode = "U9iK+jiRWZj6dvRw4MUufemid6VraP/ealwxaqayok0UQOkk989Oab1J9//hsvgz62zJL655H5bWrU36aq4/DXLliWk9/JctLn4DwRetQaNbqtSATWqorB/xvDbBqKiygUJJ13VHUuvnbmmJhciSs6Wcz1OxcqMFCxOYaNC5jJF6oPsg7ZElZ3DpoXphScJTj0xQU84kvtyo4aU1q0djHyJRnMaWKyh50WjAk7nPjwoaDllEUIfkSnK6QUbrGfgcpzjOFwBJxaUmXMgw2tYCdwVt6tiNdtORI9eNRhHLmKgy20CiYAinQ4ErAng41jv5rIwaCA9vTZtFKIX0SuuzzV7jhHzCcpQcmTGKexy3mylDgRH8lMLixyhwhY00akPpeVMWfT8FO3u9w5+6vAVyXYToboU37p5FfdPrcubc6s2jVWSxzGPjzfwTVnSsQiXIrJIP9VGbUjBHZwnSBGf5RKgwB+XDCCtHk2G3XAkUCS1r0XjT5E3isoA0Lkgc7ior";
        Message message = activationService.verifyActivationCode(activationCode);
        System.out.println(message);
    }

    @Test
    public void activateTest() {
        String activationCode = "Rlt1ezax+1sCQQxuRIKQoe7trhtET6stf95jx/fUq2xbIRiQl41EjPxXNTPWD8ev1ZdBgqcWrDtMeBYsl5Ah+iQLAyesVorpvICtBcNGAO9ltScL/3ulTLu3a47TYJQKL32mjwgYfUfcEoJhL4hPSd07mgWcXJuObLu4YYr/4FJU9aveo8p6KzUF8ow6gF1d6O0jXfqwWFQfvO7+A+J2GofzjFPxaKXdPRECuOwJ/0/BOY1j2Gk9CeJ2shYGoI3LZnrCITbwZmeyAPJRXZD0YemYQNBtal6XCspEJ+aASWPiwhApD2QsVPrA1pYy6WFVChM1UIYu0PYi/++ZxwvwOTRYCgN9MKusqxAr8sCPXhfKfkIpVF/3kjR7H9bEIBSEmaG8PvpG6WWPKZ6+p27/5z9ljGeKhSeVl6LnhMpShHlnPd6vxwsooIq78+cZaGiLkH/+zW9AaLjTrWefnp4eQH9No2NTduONBnc2nzvehlsuqDzBm0xkuj3VQbw6Tm2d";
        System.out.println(activationCode.length());
        Message message = activationService.activate(activationCode);
        System.out.println(message);
    }
}
