ALTER TABLE rooms
    ADD COLUMN is_public BOOLEAN NOT NULL DEFAULT TRUE;

CREATE INDEX idx_rooms_is_public
    ON rooms(is_public);

-- Ensure every room creator has an active HOST participant record.
-- This fixes the scenario where hosts were previously marked as left,
-- breaking the host check used for invite link management.
INSERT INTO room_participants (room_id, user_id, role, joined_at, left_at, created_at, updated_at)
SELECT room.id,
       room.created_by,
       'HOST',
       NOW(),
       NULL,
       NOW(),
       NOW()
FROM rooms room
WHERE NOT EXISTS (
    SELECT 1
    FROM room_participants participant
    WHERE participant.room_id = room.id
      AND participant.user_id = room.created_by
);

-- Restore any existing creator participant records that were marked as left
-- so the host can manage invite links again.
UPDATE room_participants AS participant
SET left_at = NULL,
    role = 'HOST',
    updated_at = NOW()
FROM rooms AS room
WHERE participant.room_id = room.id
  AND participant.user_id = room.created_by
  AND participant.left_at IS NOT NULL;
