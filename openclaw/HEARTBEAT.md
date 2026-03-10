# HEARTBEAT.md

On each heartbeat poll:

1. Check recently active sessions:
   - `sessions_list` with `activeMinutes: 1440`, `limit: 30`, `messageLimit: 8`.
2. Look at last messages for commitments phrased like:
   - "I'll check back"
   - "I'll monitor"
   - "I'll follow up"
   - "periodically"
   - "remind"
3. For any clear periodic commitment, perform the promised check now.
4. If there is something actionable/important, report it briefly.
5. If nothing needs attention, reply exactly: `HEARTBEAT_OK`

Rules:
- Be conservative. Only act on clear commitments.
- Avoid duplicate follow-ups if the same item was just checked recently.
- Keep heartbeat output short and useful.
