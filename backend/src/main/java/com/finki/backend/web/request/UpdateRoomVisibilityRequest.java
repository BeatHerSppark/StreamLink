package com.finki.backend.web.request;

import jakarta.validation.constraints.NotNull;

public record UpdateRoomVisibilityRequest(
        @NotNull(message = "Visibility is required")
        Boolean isPublic
) {
}
