
SET(COLLECTION_PATH ${TEST_NIST_DATA_ROOT} )

MACRO(TEST_NIST_PHANTOM_DATASET MASTER_DATASET_ID DATASET_ID ROI_X ROI_Y ROI_Z ROI_DX ROI_DY ROI_DZ)

SET(DATASET_ROI ${TEMP}/${DATASET_ID}_ROI.mha)

EXTRACT_REGION_OF_INTEREST(${MASTER_DATASET_ID} ${DATASET_ID} ${ROI_X} ${ROI_Y} ${ROI_Z} ${ROI_DX} ${ROI_DY} ${ROI_DZ} )
GENERATE_FEATURES( ${DATASET_ID} )

SCREEN_SHOT_FEATURES( ${DATASET_ID} 001 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 002 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 003 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 004 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 005 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 006 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 007 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 008 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 009 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 010 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 011 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 012 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 013 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 014 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 015 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 016 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 017 )
SCREEN_SHOT_FEATURES( ${DATASET_ID} 018 )

ENDMACRO(TEST_NIST_PHANTOM_DATASET)


# These phantoms have been arranged in the following configuration. If you look
# along the axial view, 
#             A
#    
#        CR1     CL1          
#        CR2     CL2          
#        CR3     CL3          
# R      CR4     CL4       L
#        CR5     CL5          
#        CR6     CL6          
#        CR7     CL7          
#        
#             P
#
# The configration CL1 and CL7 have an alternating pattern of 6.350 mm and 7.144 mm balls.
# The others have an alternating pattern of 5.556 mm and 7.938 mm balls.
#
CONVERT_DICOM_TO_META( ${COLLECTION_PATH} NIST_A "BX0317/20000101-135244-7-1")

#
# Extract ROI and compute features for it
#
# CR5 ..
TEST_NIST_PHANTOM_DATASET(NIST_A NISTCR5 
  168  291   75
   70   40  110
  )

# CR1 ..
TEST_NIST_PHANTOM_DATASET(NIST_A NISTCR1 
  160  95   60
   70  40  110
  )

# CL1 ..
TEST_NIST_PHANTOM_DATASET(NIST_A NISTCL1 
  310  95   60
   70  40  110 )

# CL2
TEST_NIST_PHANTOM_DATASET(NIST_A NISTCL2
  283 141 58
   64 48  118  )

# CL7
TEST_NIST_PHANTOM_DATASET(NIST_A NISTCL7 
  310 390 120 
   70  40 110
  )

# CR3 
TEST_NIST_PHANTOM_DATASET(NIST_A NISTCR3 
  170 200 44 
   70  40 110
  )

# CR7
TEST_NIST_PHANTOM_DATASET(NIST_A NISTCR7 
  160 392   85
   70  40  110
  )


SET(VOLUME_NIST_BEAD_A    89.801 ) # Diameter 5.556 mm
SET(VOLUME_NIST_BEAD_B   134.066 ) # Diameter 6.350 mm
SET(VOLUME_NIST_BEAD_C   190.907 ) # Diameter 7.144 mm
SET(VOLUME_NIST_BEAD_D   261.897 ) # Diameter 7.938 mm

#
# From the same feature images and ROI, use different sets of seed points
#
COMPUTE_SEGMENTATIONS( NISTCR5 001  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR5 002  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR5 003  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR5 004  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR5 005  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR5 006  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR5 007  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR5 008  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR5 009  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR5 010  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR5 011  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR5 012  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR5 013  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR5 014  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR5 015  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR5 016  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR5 017  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR5 018  ${VOLUME_NIST_BEAD_D} )

COMPUTE_SEGMENTATIONS( NISTCR1 001  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR1 002  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR1 003  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR1 004  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR1 005  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR1 006  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR1 007  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR1 008  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR1 009  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR1 010  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR1 011  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR1 012  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR1 013  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR1 014  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR1 015  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR1 016  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR1 017  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR1 018  ${VOLUME_NIST_BEAD_D} )

COMPUTE_SEGMENTATIONS( NISTCL7 001  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL7 002  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL7 003  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL7 004  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL7 005  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL7 006  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL7 007  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL7 008  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL7 009  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL7 010  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL7 011  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL7 012  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL7 013  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL7 014  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL7 015  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL7 016  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL7 017  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL7 018  ${VOLUME_NIST_BEAD_C} )

COMPUTE_SEGMENTATIONS( NISTCR3 001  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR3 002  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR3 003  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR3 004  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR3 005  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR3 006  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR3 007  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR3 008  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR3 009  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR3 010  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR3 011  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR3 012  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR3 013  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR3 014  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR3 015  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR3 016  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR3 017  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR3 018  ${VOLUME_NIST_BEAD_D} )

COMPUTE_SEGMENTATIONS( NISTCR7 001  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR7 002  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR7 003  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR7 004  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR7 005  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR7 006  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR7 007  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR7 008  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR7 009  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR7 010  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR7 011  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR7 012  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR7 013  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR7 014  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR7 015  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCR7 016  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR7 017  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCR7 018  ${VOLUME_NIST_BEAD_D} )

COMPUTE_SEGMENTATIONS( NISTCL1 001  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL1 002  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL1 003  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL1 004  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL1 005  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL1 006  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL1 007  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL1 008  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL1 009  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL1 010  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL1 011  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL1 012  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL1 013  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL1 014  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL1 015  ${VOLUME_NIST_BEAD_C} )
COMPUTE_SEGMENTATIONS( NISTCL1 016  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL1 017  ${VOLUME_NIST_BEAD_B} )
COMPUTE_SEGMENTATIONS( NISTCL1 018  ${VOLUME_NIST_BEAD_B} )

COMPUTE_SEGMENTATIONS( NISTCL2 001  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCL2 002  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCL2 003  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCL2 004  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCL2 005  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCL2 006  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCL2 007  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCL2 008  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCL2 009  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCL2 010  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCL2 011  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCL2 012  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCL2 013  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCL2 014  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCL2 015  ${VOLUME_NIST_BEAD_D} )
COMPUTE_SEGMENTATIONS( NISTCL2 016  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCL2 017  ${VOLUME_NIST_BEAD_A} )
COMPUTE_SEGMENTATIONS( NISTCL2 018  ${VOLUME_NIST_BEAD_A} )

