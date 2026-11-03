# 예시: Flipkart Ads API의 insights 분석

`api-analysis` 스킬을 이렇게 씁니다. 분석할 API는 Flipkart(인도의 온라인 쇼핑몰) 광고 API의 성과 조회입니다.

```
GET https://ads.api.flipkart.net/flipkart-ads/ba/{business_account_id}/aa/{ad_account_id}/insights
```

- Swagger 문서: <https://advertising.flipkart.com/swagger-docs/api/reference/swagger/>
- 호출 한도 문서: <https://advertising.flipkart.com/swagger-docs/api/guide/ratelimit/>

## 시킬 말
```
아래 문서를 읽고 GET /insights API를 분석해 줘.
인증, 파라미터, 응답 필드, 사용 한도를 표로 정리하고, 문서끼리 맞지 않는 곳도 알려 줘.
주소를 읽지 못하면 추측하지 말고 읽지 못했다고 먼저 알려 줘.

https://advertising.flipkart.com/swagger-docs/api/reference/swagger/
https://advertising.flipkart.com/swagger-docs/api/guide/ratelimit/
```

## 이어서 물을 말
문서를 읽은 뒤에 한 가지만 더 알고 싶을 때는 짧게 물어도 됩니다.
```
Flipkart Ads API 호출 위한 제한사항 설명해줘.
```

## 주소를 읽지 못했다고 하면
이 문서 사이트는 프로그램의 접근을 막아서 Claude가 읽지 못할 수 있습니다. 그때는 이렇게 합니다.
1. 브라우저에서 두 주소를 엽니다.
2. 문서 내용을 복사합니다.
3. 같은 시킬 말 아래에 주소 대신 복사한 내용을 붙여 넣고 다시 시킵니다.

## 확인할 점
- 문서에 없는 한도나 필드를 지어내지 않았는지
- 문서끼리 맞지 않는 곳을 `확인 필요`에 적었는지
- 토큰, 비밀값, 계정 ID 값이 결과에 들어가지 않았는지
