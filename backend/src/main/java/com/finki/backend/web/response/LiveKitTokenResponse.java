package com.finki.backend.web.response;

import lombok.Builder;

@Builder
public record LiveKitTokenResponse(
        String token,
        String serverUrl,
        String roomName
) {
}
